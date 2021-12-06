<?php

namespace App\Http\Controllers\frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Mail\Email;
use App\PromocodesModel;
use App\PromocodesGroup;
use App\Register;
use Illuminate\Support\Facades\Mail;

class MailController extends Controller
{
    public function register(Request $request)
	{
		$code= PromocodesModel::where('id_group',PromocodesGroup::CODE_REGISTER)
                                ->where('is_used',0)
                                ->whereDate('expiration_date','>=',date('Y-m-d'))
                                ->first();
                            
	  $email=  $request->get('email');
	   $check = Register::where('email',$email)->first();
	   if (!empty($check)) {
	   		return 'had';
	   }
	   else {
	   	if (empty($code)) {
	   		Register::create(['email'=>$email]);
	   		Mail::send('email.register',['code'=>'Tạm thời hết code!'], function($message) use ($email) {
	   			$message->from('cuong56800@st.vimaru.edu.vn', 'HVC Shop');
      			$message->to($email)->subject('Đăng ký thành công!');
      		});
      		return 'sent';
	   	}
	   	else{
	   		// Register::create(['email'=>$email]);
	   		// PromocodesModel::where('code',$code->code)->update(['email'=>$email]);
	   		Mail::send('email.register',['code'=>$code->code], function($message) use ($email) {
	   			$message->from('cuong56800@st.vimaru.edu.vn', 'HVC Shop');
      			$message->to($email)->subject('Đăng ký thành công!');
      		});
      		return 'sent';
	   	}
	   		
	   	
	   }
	   
	   
	   
	}
}
