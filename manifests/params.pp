class openvmtools::params {
  $enabled = true

  case $::operatingsystem {
    debian,ubuntu: {
      $packages = ['open-vm-tools']
      $service = 'open-vm-tools'
    }

    redhat,centos,scientific,oraclelinux,fedora: {
      $packages = ['open-vm-tools']
      $service = 'vmtoolsd'
    }

    default: {
      fail("Unsupported OS: ${::operatingsystem}")
    }
  }
}
