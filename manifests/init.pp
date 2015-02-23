class open_vm_tools (
  $enabled   = $open_vm_tools::params::enabled,
  $packages  = $open_vm_tools::params::packages,
  $service   = $open_vm_tools::params::service,
  $hasstatus = $open_vm_tools::params::hasstatus,
  $pattern   = $open_vm_tools::params::pattern
) inherits open_vm_tools::params {

  class { 'open_vm_tools::install':
    enabled  => $enabled,
    packages => $packages,
  }

  class { 'open_vm_tools::service':
    enabled   => $enabled,
    service   => $service,
    hasstatus => $hasstatus,
    pattern   => $pattern,
  }

  if $enabled {
    anchor { 'open_vm_tools::begin': ; }
      -> Class['open_vm_tools::install']
      ~> Class['open_vm_tools::service']
      -> anchor { 'open_vm_tools::end': ; }
  } else {
    anchor { 'open_vm_tools::begin': ; }
      -> Class['open_vm_tools::service']
      -> Class['open_vm_tools::install']
      -> anchor { 'open_vm_tools::end': ; }
  }
}
