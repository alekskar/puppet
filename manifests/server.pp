class puppet::server inherits puppet {

  package { 'puppetserver':
    ensure => $puppet::puppet_version
    notify { "Puppet server at $hostname has been installed": }
  }
  $signdomain = $facts['networking']['domain']
  $autosign_domain = $domain
  file { '/etc/puppetlabs/puppet/autosign.conf':
      ensure  => file,
      content => template('/etc/puppetlabs/code/modules/exit/templates/autosign.conf.erb'),
	  require => Package['puppetserver'],
	  notify  => Service['puppetserver'], 
  }
  
  service { 'puppetserver':
    ensure  => 'running',
	enable  => true,
	require => Package['puppetserver'],
 
  
  }
  
  exec { 'update_path':
    command  => 'source /root/.bash_profile',
    provider => shell,
  }
  
}
  
  
 

#if $facts['os']['family'] == 'redhat' {
#  # ...
#}
}

