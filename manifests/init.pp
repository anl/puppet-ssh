# == Class: ssh
#
# Install and configure SSH.
#
# === Parameters
#
# Document parameters here.
#
# [*fw_rules*]
#   Hash of firewall rules to be passed to puppetlabs-firewall's "firewall"
#   type; expected to include a "name" key/value pair for ordering.
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
class ssh (
  $fw_rules = { 'open' => { name   => '100 allow ssh access',
                            action => accept } }
  ) inherits ssh::params {

  package { [ $ssh::client_pkg, $ssh::server_pkg ]:
    ensure => present
  }

}
