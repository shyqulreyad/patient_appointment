<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\SuperAdminController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\ProviderController;

Route::get('/', function () {
    if(auth()->guard('super_admin')->check()){
        return redirect('superadmin/dashboard');
    }elseif(auth()->guard('admin')->check()){
        return redirect('admin/dashboard');
    }elseif(auth()->guard('provider')->check()){
        return redirect('provider/dashboard');
    }else{
        return view('welcome');
    }
})->name('home');


Route::post('/login', [AuthController::class, 'login'])->name('login');
Route::get('/logout', [AuthController::class, 'logout'])->name('logout');


// Super Admin Routes
Route::group(['middleware' => ['auth:super_admin']], function () {
    Route::get('superadmin/dashboard', [SuperAdminController::class, 'superadminDashboard'])->name('superadmindashboard');
    Route::get('superadmin/auth', [SuperAdminController::class, 'superadminauth'])->name('superadminauth'); 
    Route::get('superadmin/service', [SuperAdminController::class, 'superadminservice'])->name('superadminservice');
    Route::Post('superadmin/auth/create', [SuperAdminController::class, 'insert_auth'])->name('insert_auth');
    Route::post('superadmin/service/create', [SuperAdminController::class, 'insert_service'])->name('insert_service');
    Route::get('get_auth/{patient_id}', [SuperAdminController::class, 'get_auth'])->name('get_auth');
    Route::get('get_service/{auth_id}', [SuperAdminController::class, 'get_service'])->name('get_service');
    Route::post('superadmin/make_appointment', [SuperAdminController::class, 'make_appointment'])->name('make_appointment');
   
});

// Admin Routes
Route::group(['middleware' => ['auth:admin']], function () {
    Route::get('admin/dashboard', [AdminController::class, 'adminDashboard'])->name('admindashboard');
    Route::get('admin/auth', [AdminController::class, 'adminauth'])->name('adminauth');
    Route::get('admin/service', [AdminController::class, 'adminservice'])->name('adminservice');
    Route::Post('admin/auth/create', [AdminController::class, 'insert_auth'])->name('admin_insert_auth');
    Route::post('admin/service/create', [AdminController::class, 'insert_service'])->name('admin_insert_service');
    Route::get('admin/get_auth/{patient_id}', [AdminController::class, 'get_auth'])->name('admin_get_auth');
    Route::get('admin/get_service/{auth_id}', [AdminController::class, 'get_service'])->name('admin_get_service');
    Route::post('admin/make_appointment', [AdminController::class, 'make_appointment'])->name('admin_make_appointment');

});

// Provider Routes
Route::group(['middleware' => ['auth:provider']], function () {
    Route::get('provider/dashboard', [ProviderController::class, 'providerDashboard'])->name('providerdashboard');
    Route::get('provider/auth', [ProviderController::class, 'providerauth'])->name('providerauth');
    Route::get('provider/service', [ProviderController::class, 'providerservice'])->name('providerservice');
    Route::Post('provider/auth/create', [ProviderController::class, 'insert_auth'])->name('provider_insert_auth');
    Route::post('provider/service/create', [ProviderController::class, 'insert_service'])->name('provider_insert_service');
    Route::get('provider/get_auth/{patient_id}', [ProviderController::class, 'get_auth'])->name('provider_get_auth');
    Route::get('provider/get_service/{auth_id}', [ProviderController::class, 'get_service'])->name('provider_get_service');
    Route::post('provider/make_appointment', [ProviderController::class, 'make_appointment'])->name('provider_make_appointment');

});



