<ul class="nav nav-pills nav-fill bg-info">
    <li class="nav-item">
      <a class="nav-link @yield('dashboard')" href="{{route('admindashboard')}}">Dashboard</a>
    </li>
    <li class="nav-item">
      <a class="nav-link @yield('auth')" href="{{route('adminauth')}}">Auth</a>
    </li>
    <li class="nav-item">
      <a class="nav-link @yield('service')" href="{{route('adminservice')}}">Service</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="{{route('logout')}}" tabindex="-1" aria-disabled="true">Logout(Admin)</a>
    </li>
  </ul>