class puppet::client inherits puppet {
  
  package { 'puppet':
    ensure => $puppet::puppet_version
	notify { "Puppet client at $hostname has been installed": }
   
  }
  
  service { 'puppet':
    ensure => 'running',
	enable => true,
	require => Package['puppet'],
	notify { "Puppet client at $hostname has been installed": }

}

#ensure  => '1.2.0',