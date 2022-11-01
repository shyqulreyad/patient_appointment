<ul class="nav nav-pills nav-fill bg-info">
    <li class="nav-item">
      <a class="nav-link @yield('dashboard')" href="{{route('superadmindashboard')}}">Dashboard</a>
    </li>
    <li class="nav-item">
      <a class="nav-link @yield('auth')" href="{{route('superadminauth')}}">Auth</a>
    </li>
    <li class="nav-item">
      <a class="nav-link @yield('service')" href="{{route('superadminservice')}}">Service</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="{{route('logout')}}" tabindex="-1" aria-disabled="true">Logout(superadmin)</a>
    </li>
  </ul>