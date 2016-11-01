class open_vm_tools::params {
  $enabled = true
  $pattern = 'vmtoolsd'

  case $::operatingsystem {
    debian,ubuntu: {
      $packages = ['open-vm-tools']
      $service = 'open-vm-tools'
      $hasstatus = false
    }

    redhat,centos,scientific,oraclelinux,fedora: {
      $packages = ['open-vm-tools']
      $service = 'vmtoolsd'
      $hasstatus = true
    }

    freebsd: {
      $packages = ['open-vm-tools-nox11']
      $service = ['vmware-guestd', 'vmware-kmod']
      $hasstatus = true
    }

    default: {
      warning("Unsupported OS: ${::operatingsystem}")
    }
  }
}
