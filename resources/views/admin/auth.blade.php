@extends('layout.template')
@section('content')
@section('auth')
active
@endsection
@include('admin/nav')

<div class="container">
  <div class="row">
    <div class="col-8">
      <h5 class="mt-3">List of Auths with patient info</h5>
      <table class="table">
        <thead class="thead-dark">
          <tr>
            <th scope="col">Auth Name</th>
            <th scope="col">Auth info</th>
            <th scope="col">Patient name</th>
            <th scope="col">Patient Address</th>
            <th scope="col">Patient phone</th>
          </tr>
        </thead>
        <tbody>
          @foreach ($auths as $auth)
          <tr>
            <td>{{$auth->auth_name}}</td>
            <td>{{$auth->auth_info}}</td>
            <td>{{$auth->patient_name}}</td>
            <td>{{$auth->address}}</td>
            <td>{{$auth->phone}}</td>
          </tr>
          @endforeach
        </tbody>
      </table>
    </div>
    <div class="col-4">
      <div class="card">
        <div class="card-header">
          <h5 class="card-title">Add New Auth</h5>
          @if (session('success'))
          <div class="alert alert-success">
            {{ session('success') }}
          @endif
        </div>
        <div class="card-body">
          <form action="{{route('admin_insert_auth')}}" method="POST">
            @csrf
            <div class="form-group">
              <label for="exampleFormControlInput1">Auth name</label>
              <input type="text" name="auth_name" class="form-control" id="exampleFormControlInput1" placeholder="Auth name" >
              @error('auth_name') <div class="alert alert-danger">{{ $message }}</div> @enderror
            </div>
            <div class="form-group">
              <label for="exampleFormControlSelect1">select Patient</label>
              <select name="patient_id" class="form-control" id="exampleFormControlSelect1">
                <?php
                  foreach ($patients as $patient) {
                    echo "<option value='$patient->id'>$patient->patient_name</option>";
                  }
                ?>
              </select>
            </div>
            <div class="form-group">
              <label for="exampleFormControlTextarea1">Auth info</label>
              <textarea name="auth_info" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
            </div>
            @error('auth_info') <div class="alert alert-danger">{{ $message }}</div> @enderror
            <button type="submit" class="btn btn-primary">Add</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

@endsection