# == Class: ssh::params
#
# Params class for ssh.
#
# === Examples
#
# class ssh inherits ssh::params {}
#
# === Authors
#
# Andrew Leonard
#
# === Copyright
#
# Copyright 2013 Andrew Leonard
#
class ssh::params {
  case $::operatingsystem {
    ubuntu: {
      $client_pkg = 'openssh-client'
      $server_pkg = 'openssh-server'
      $service = 'ssh'
    }
    default: {
      fail("Unsupported os: $::operatingsystem")
    }
  }
}
