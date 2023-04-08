@extends('layout.template')
@section('content')
@section('dashboard')
active
@endsection
@include('superadmin/nav')
<div class="container">
    <div class="row">
      <div class="col-8">
        <h5 class="mt-3">List of Appointments</h5>
        <table class="table">
          <thead class="thead-dark">
            <tr>
                <th scope="col">Patient name</th>
                <th scope="col">Auth Name</th>
              <th scope="col">Service Name</th>
              <th scope="col">Appointment date</th>
              <th scope="col">Status</th>
 
            </tr>
          </thead>
          <tbody>
            @foreach ($appointments as $appointment)
            
            <tr>
                <td>{{$appointment->patient_name}}</td>
                <td>{{$appointment->auth_name}}</td>
                <td>{{$appointment->service_name}}</td>
              <td>{{$appointment->appointment_date}}</td>
              <td>{{$appointment->status}}</td>
            </tr>
            @endforeach
          </tbody>
        </table>
      </div>
      <div class="col-4">
        <div class="card">
          <div class="card-header">
            <h5 class="card-title">Add New Appointment</h5>
            @if (session('success'))
            <div class="alert alert-success">
              {{ session('success') }}
            @endif
          </div>
          <div class="card-body">
            <form action="{{route('make_appointment')}}" method="POST">
              @csrf
              <div class="form-group">
                <div class="form-group">
                    <label for="exampleFormControlSelect1">select Patient Name</label>
                    <select name="patient_id" class="form-control" id="patient_id">
                        <option value="">Select Patient</option>
                      <?php
                        foreach ($patients as $patient) {
                          echo "<option value='$patient->id'>$patient->patient_name</option>";
                        }
                      ?>
                    </select>
                    @error('patient_id') <div class="alert alert-danger">{{ $message }}</div> @enderror
                  </div>

              <div class="form-group">
                <label for="exampleFormControlSelect1">select Auth Name</label>
                <select name="auth_id" class="form-control" id="auth_list">
                    <option >Select Patient First</option>
                </select>
                @error('auth_id') <div class="alert alert-danger">{{ $message }}</div> @enderror
              </div>
              <div class="form-group">
                <label for="exampleFormControlSelect1">select Service Name</label>
                <select name="service_id" class="form-control" id="service_id">
                    <option >Select Auth First</option>
                </select>
                @error('service_id') <div class="alert alert-danger">{{ $message }}</div> @enderror
              </div>
              <div class="form-group">
                <label for="exampleFormControlInput1">Appointment date</label>
                <input type="date" name="appointment_date" class="form-control" id="exampleFormControlInput1" placeholder="appointment date" >
                @error('appointment_date') <div class="alert alert-danger">{{ $message }}</div> @enderror
            </div>
              <button type="submit" class="btn btn-primary">Add Appointment</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  @section('script')

     <script>
            $('#patient_id').on('change',function(){
                var patient_id = $(this).val();
                if(patient_id){
                    $.ajax({
                        type:"GET",
                        url:"{{url('get_auth')}}/"+patient_id,
                        success:function(res){
                            if(res){
                            console.log(res.success);
                        $('#auth_list').html(res.success);
                         }else{
                                $("#auth_list").empty();
                            }
                        }
                    });
                }else{
                    $("#patient_id").empty();
                }
            });

            $('#auth_list').on('change',function(){
                var auth_id = $(this).val();
                if(auth_id){
                    $.ajax({
                        type:"GET",
                        url:"{{url('get_service')}}/"+auth_id,
                        success:function(res){
                        console. log(res) 
                            if(res){
                            console.log(res.success);
                        $('#service_id').html(res.success);
                         }else{
                                $("#service_id").empty();
                            }
                        }
                    });
                }else{
                    $("#auth_list").empty();
                }
            });
    </script>
  @endsection
@endsection
