class open_vm_tools::service (
  $enabled,
  $service,
  $hasstatus,
  $pattern
) {
  $_ensure = $enabled ? {
    true  => running,
    false => stopped,
  }

  if $::virtual == 'vmware' {
    service { $service:
      ensure    => $_ensure,
      enable    => $enabled,
      hasstatus => $hasstatus,
      pattern   => $pattern,
    }
  } elsif $enabled {
    warning('Not running on VMware, skipping service.')
  }
}
