@extends('layout.template')
@section('content')
        <div class="container">
            <section class="vh-100">
                <div class="container-fluid h-custom">
                  <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-md-9 col-lg-6 col-xl-5">
                      <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
                        class="img-fluid" alt="Sample image">
                    </div>
                    <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                      <form action="{{route('login')}}" method="post">
                        @csrf
              
                        <!-- Email input -->
                        <div class="form-outline mb-4">
                          <label class="form-label" for="form3Example3">Email address</label>
                          <input type="email" id="form3Example3" name="email" class="form-control form-control-lg"
                            placeholder="Enter a valid email address" value="{{old('email')}}"/>
                            
                            @error('email') <span class="text-danger">{{ $message }}</span> @enderror
                         
                        </div>
              
                        <!-- Password input -->
                        <div class="form-outline mb-3">
                          <label class="form-label" for="form3Example4">Password</label>
                          <input type="password" id="form3Example4" name="password" class="form-control form-control-lg"
                            placeholder="Enter password"  />
                            @error('password') <span class="text-danger">{{ $message }}</span> @enderror
                      
                        </div>
                          @if (session('error'))
                          <div class="alert alert-danger">
                              {{ session('error') }}
                          </div>
                      @endif
                        <div class="text-center text-lg-start mt-4 pt-2">
                          <button type="submit" class="btn btn-primary btn-lg"
                            style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
                        </div>
              
                      </form>
                    </div>
                  </div>
                </div>
              </section>
        </div>
@endsection
