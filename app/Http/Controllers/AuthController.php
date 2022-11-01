<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);
        $credentials = $request->only('email', 'password');
      if(Auth::guard('super_admin')->attempt($credentials)){
            return redirect('superadmin/dashboard');
        }elseif(Auth::guard('admin')->attempt($credentials)){
            return redirect('admin/dashboard');
        }elseif(Auth::guard('provider')->attempt($credentials)){
            return redirect('provider/dashboard');
        }else{
            return redirect()->back()->with('error', 'Invalid Credentials');
        }
       
    }

    public function logout()
    {
       if(auth()->guard('super_admin')->check()){
            auth()->guard('super_admin')->logout();
        }elseif(auth()->guard('admin')->check()){
            auth()->guard('admin')->logout();
        }elseif(auth()->guard('provider')->check()){
            auth()->guard('provider')->logout();
        }
        return redirect('/');
    }


}
