<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Patient;
use App\Models\Auth;
use App\Models\Service;
use App\Models\Appointment;
use Illuminate\Support\Facades\DB;


class SuperAdminController extends Controller
{
    public function superadminDashboard()
    {
        return view('superadmin.dashboard', [
            'patients' => Patient::all(),
            'appointments' => DB::table('appointments')
                ->join('patients', 'appointments.patient_id', '=', 'patients.id')
                ->join('auths', 'appointments.auth_id', '=', 'auths.id')
                ->join('services', 'appointments.service_id', '=', 'services.id')
                ->select('appointments.*', 'patients.patient_name', 'auths.auth_name', 'services.service_name')
                ->get(),
        ]);
    }

    public function superadminauth()
    {
        return view('superadmin.auth', [
            'patients' => Patient::all(),
            'auths' => DB::table('auths')
                ->join('patients', 'auths.patient_id', '=', 'patients.id')
                ->select('auths.*', 'patients.*')
                ->get(),
        ]);
    }

    public function superadminservice()
    {
        return view('superadmin.service', [
            'auths' => Auth::all(),
            'services' => DB::table('services')
                ->join('auths', 'services.auth_id', '=', 'auths.id')
                ->select('services.*', 'auths.*')
                ->get(),
        ]);
    }

    public function insert_auth(Request $request)
    {
        $request->validate([
            'patient_id' => 'required',
            'auth_name' => 'required',
            'auth_info' => 'required',
        ]);

        Auth::create([
            'patient_id' => $request->patient_id,
            'auth_name' => $request->auth_name,
            'auth_info' => $request->auth_info,
        ]);

        return redirect()->route('superadminauth')->with('success', 'Auth Created Successfully');
    }

    public function insert_service(Request $request)
    {
        $request->validate([
            'auth_id' => 'required',
            'service_name' => 'required',
            'service_info' => 'required',
        ]);

        Service::create([
            'auth_id' => $request->auth_id,
            'service_name' => $request->service_name,
            'service_info' => $request->service_info,
        ]);

        return redirect()->route('superadminservice')->with('success', 'Service Created Successfully');
    }

    public function get_auth($patient_id)
    {
        if($patient_id != 0){
            $auth_list = "<option value=''>Select Auth </option>";
            if(Auth::select('auth_name','id')->where('patient_id', $patient_id)->exists()){
                $auths_db= Auth::select('auth_name','id')->where('patient_id', $patient_id)->get();
                foreach($auths_db as $auth_db){
                    $auth_list .= " <option value='$auth_db->id'>".$auth_db->auth_name."</option>";
                }
            }else{
                $auth_list = "<option value=''>No Auth Available</option>";
            }

        }else{
            $auth_list = "<option value=''>Select patient first</option>";
        }

        return response()->json([
            'success' =>  $auth_list,
            ]);
    }

    public function get_service($auth_id)
    {
        if($auth_id != 0){
            $service_list = "<option value=''>Select Service </option>";
            if(Service::select('service_name','id')->where('auth_id', $auth_id)->exists()){
                $services_db= Service::select('service_name','id')->where('auth_id', $auth_id)->get();
                foreach($services_db as $service_db){
                    $service_list .= " <option value='$service_db->id'>".$service_db->service_name."</option>";
                }
            }else{
                $service_list = "<option value=''>No Service Available</option>";
            }

        }else{
            $service_list = "<option value=''>Select auth first</option>";
        }

        return response()->json([
            'success' =>  $service_list,
            ]);
    }

    public function make_appointment(Request $request)
    {
        $request->validate([
            'patient_id' => 'required',
            'auth_id' => 'required',
            'service_id' => 'required',
            'appointment_date' => 'required',
        ]);

        Appointment::create([
            'patient_id' => $request->patient_id,
            'auth_id' => $request->auth_id,
            'service_id' => $request->service_id,
            'appointment_date' => $request->appointment_date,
            'status' => 'pending',
        ]);

        return redirect()->route('superadmindashboard')->with('success', 'Appointment Created Successfully');
    } 
}
