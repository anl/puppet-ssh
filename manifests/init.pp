# == Class: ssh
#
# Install and configure SSH.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Examples
#
# include ssh
#
# === Authors
#
# Andrew Leonard
#
# === Copyright
#
# Copyright 2013 Andrew Leonard
#
class ssh inherits ssh::params {

  package { [ $ssh::client_pkg, $ssh::server_pkg ]:
    ensure => present
  }

  if member(hiera_array('classes'), 'firewall') {
    firewall { '100 allow ssh access':
      action => accept,
      port   => 22,
      proto  => tcp,
    }
  }
}
