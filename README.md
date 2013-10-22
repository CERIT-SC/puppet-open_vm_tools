# Puppet module for Open VM Tools

This module installs and starts [Open VM Tools][OPENVMTOOLS]
for virtual machines running under VMware.

### Requirements

Module has been tested on:

* Puppet 3.3
* Debian and RHEL/CentOS 6

Required modules:

* stdlib (https://github.com/puppetlabs/puppetlabs-stdlib)

# Quick Start

Setup

```puppet
include openvmtools
```

Full configuration options:

```puppet
class { 'openvmtools':
  enabled  => true|false, # enable state
  packages => [...],      # override list of packages to install
  service  => '...',      # override service name
}
```

[OPENVMTOOLS]: http://open-vm-tools.sourceforge.net/

***

CERIT Scientific Cloud, <support@cerit-sc.cz>
