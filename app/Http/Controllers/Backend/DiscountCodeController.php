<?php

namespace App\Http\Controllers\backend;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\PromocodesModel;
use App\PromocodesGroup;

class DiscountCodeController extends Controller
{

    public function index(Request $request)
    {

        $code = PromocodesModel::all();
        $group = PromocodesModel::select('id_group', DB::raw('COUNT(*) as number_ingroup'))->groupBy('id_group')->get();
        $code_is_used = PromocodesModel::select('id_group', DB::raw('COUNT(is_used) as number_is_used'))
            ->where('is_used', 1)->groupBy('id_group')->get();
        return view('backend/discountcode/index', compact('code', 'group', 'code_is_used'));
    }


    public function create()
    {
        $group = PromocodesGroup::orderBy('id')->get();
        return view('backend/discountcode/create', compact('group'));
    }
    public function store(Request $request)
    {
        $input = $request->all();

        $validator = $request->validate([
            'qty' => 'required|min:1|max:100',
            'value' => 'required',
            'expiration_date' => 'required'
        ]);

        $qty = $input['qty'];
        $is_used = 0;
        if ($input['type'] == 0) {
            $cash = $input['value'];
            $percent = 0;
        } elseif ($input['type'] == 1) {
            $percent = $input['value'];
            $cash = 0;
        }
        $created_at = date('Y-m-d');
        $expiration_date = date('Y-m-d', strtotime($input['expiration_date']));

        PromocodesModel::updateOrCreate([
            'code' =>  $qty,
            'is_used' => $is_used,
            'cash' => $cash,
            'percent' => $percent,
            'expiration_date' => $expiration_date,
            'id_group' => $input['id_group'],
            'created_at' => $created_at,
        ]);

        return redirect()->route('admin.discountcode.index');
    }

    public function destroy($id)
    {
        PromocodesModel::find($id)->delete();
        return redirect()->back();
    }
    public function toggleGroup(Request $request)
    {
        $group = $request->get('group');
        if (is_null($group)) {
            return redirect()->back();
        } else {
            $this->deleteGroup($group);
            return redirect()->back();
        }
    }
    function deleteGroup($group)
    {
        if (in_array(0, $group)) {
            $code = PromocodesModel::whereNotIn('id', $group);
        } else {
            $check = true;
            if ($group[0] < 0) {
                $check = false;
                foreach ($group as $key => $value) {
                    $group[$key] = abs($value);
                }
            }
            if ($check == false) {
                $code = PromocodesModel::whereNotIn('id', $group);
            } else {
                $code = PromocodesModel::whereIn('id', $group);
            }
        }
        $code->delete();
    }

    public function addGroupPromocodes(Request $request)
    {
        $input = $request->all();
        PromocodesGroup::create($input);
        return redirect()->back();
    }
}
