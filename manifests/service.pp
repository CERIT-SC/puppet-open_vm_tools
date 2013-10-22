class openvmtools::service (
  $enabled,
  $service
) {
  $_ensure = $enabled ? {
    true  => running,
    false => stopped,
  }

  if $::virtual == 'vmware' {
    service { $service:
      ensure => $_ensure,
      enable => $enabled,
    }
  } elsif $enabled {
    warning('Not running on VMware, skipping service.')
  }
}
