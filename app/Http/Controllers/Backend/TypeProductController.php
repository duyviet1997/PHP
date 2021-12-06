<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Repositories\TypeProductRepository;
use Repositories\ProductsRepository;
class TypeProductController extends Controller
{
     public function __construct(TypeProductRepository $TypeProductRepo,ProductsRepository $ProductsRepo)
	{
		 
           $this->TypeProductRepo = $TypeProductRepo;
           $this->ProductsRepo = $ProductsRepo;
	}
    

      public function index(Request $request) {
       
         $type= $this->TypeProductRepo->getAllProducts();
         $update="";
        return view('backend/TypeProduct/index', compact('type','update'));
    }


    public function create() {
        $type= $this->TypeProductRepo->getAllProducts();
       
        return view('backend/Products/create',compact('type'));
    }
     public function store(Request $request) {
        $input = $request->all();
        $validator = \Validator::make($input, $this->TypeProductRepo->validateCreate());
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }
        $this->TypeProductRepo->create($input);

        return redirect()->back();
    }

     public function edit($id) {

        $typeproducts = $this->TypeProductRepo->find($id);
        return view('backend/TypeProduct/update',compact('typeproducts'));
    }
    public function update(Request $request, $id)
    {
      $input = $request->all();
        $validator = \Validator::make($input, $this->TypeProductRepo->validateCreate());
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }
       $this->TypeProductRepo->update($input, $id);
        return redirect()->route('admin.typeproduct.edit', $id)->with('success', 'Update thành công');
    }
    public function destroy($id) {
        $this->TypeProductRepo->delete($id);
        return redirect()->back();
    }
}
