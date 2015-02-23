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

    default: {
      fail("Unsupported OS: ${::operatingsystem}")
    }
  }
}
