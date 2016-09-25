# == Class: puppet
#
# Copyright 2016 Your name here, unless otherwise noted.

class puppet (
  $puppet_server_version = 'installed',
  $puppet_agent_version  = 'installed'
  ) {
  notice ( "!!!!!!!!!!!!!!!!!!!!!!!!!Puppet server? -  ${::is_puppetserver} !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
  if $::is_puppetserver == 'true' {
    class { 'puppet::repo': } ->
    class { 'puppet::server': }
    }

  else {
    class { 'puppet::repo': } ->
    class { 'puppet::client': }
  }
}

