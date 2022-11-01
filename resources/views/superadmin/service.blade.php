@extends('layout.template')
@section('content')
@section('service')
active
@endsection
@include('superadmin/nav')

<div class="container">
    <div class="row">
      <div class="col-8">
        <h5 class="mt-3">List of service with Auth info</h5>
        <table class="table">
          <thead class="thead-dark">
            <tr>
                <th scope="col">Service name</th>
                <th scope="col">Service info</th>
              <th scope="col">Auth Name</th>
              <th scope="col">Auth info</th>
 
            </tr>
          </thead>
          <tbody>
            @foreach ($services as $service)
            
            <tr>
                <td>{{$service->service_name}}</td>
                <td>{{$service->service_info}}</td>
              <td>{{$service->auth_name}}</td>
              <td>{{$service->auth_info}}</td>
            </tr>
            @endforeach
          </tbody>
        </table>
      </div>
      <div class="col-4">
        <div class="card">
          <div class="card-header">
            <h5 class="card-title">Add New Service</h5>
            @if (session('success'))
            <div class="alert alert-success">
              {{ session('success') }}
            @endif
          </div>
          <div class="card-body">
            <form action="{{route('insert_service')}}" method="POST">
              @csrf
              <div class="form-group">
                <label for="exampleFormControlInput1">Service name</label>
                <input type="text" name="service_name" class="form-control" id="exampleFormControlInput1" placeholder="service name" >
                @error('service_name') <div class="alert alert-danger">{{ $message }}</div> @enderror
              </div>
              <div class="form-group">
                <label for="exampleFormControlSelect1">select Auth Name</label>
                <select name="auth_id" class="form-control" id="exampleFormControlSelect1">
                  <?php
                    foreach ($auths as $auth) {
                      echo "<option value='$auth->id'>$auth->auth_name</option>";
                    }
                  ?>
                </select>
              </div>
              <div class="form-group">
                <label for="exampleFormControlTextarea1">service info</label>
                <textarea name="service_info" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
              </div>
              @error('service_info') <div class="alert alert-danger">{{ $message }}</div> @enderror
              <button type="submit" class="btn btn-primary">Add</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
@endsection