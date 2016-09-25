# this claas handled setup puppet on client
class puppet::client inherits puppet {
  package { 'puppet':
    ensure => $puppet::puppet_agent_version,
  }
  notify {"Puppet client at ${::hostname} with ${::puppet_agent_version} has been installed": }
  service { 'puppet':
    ensure  => 'running',
    enable  => true,
    require => Package['puppet'],
  }
  notify { "Puppet client at ${::hostname} has been installed": }
}
