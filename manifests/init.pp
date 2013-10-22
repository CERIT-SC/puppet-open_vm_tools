class openvmtools (
  $enabled  = $openvmtools::params::enabled,
  $packages = $openvmtools::params::packages,
  $service  = $openvmtools::params::service,
) inherits openvmtools::params {

  class { 'openvmtools::install':
    enabled  => $enabled,
    packages => $packages,
  }

  class { 'openvmtools::service':
    enabled => $enabled,
    service => $service,
  }

  if $enabled {
    anchor { 'openvmtools::begin': ; }
      -> Class['openvmtools::install']
      ~> Class['openvmtools::service']
      -> anchor { 'openvmtools::end': ; }
  } else {
    anchor { 'openvmtools::begin': ; }
      -> Class['openvmtools::service']
      -> Class['openvmtools::install']
      -> anchor { 'openvmtools::end': ; }
  }
}
