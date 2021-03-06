# this class setup puppet server
class puppet::server inherits puppet {

  $autosign_domain = $::domain
  $mem = $::mem_to_allocate
  info ( "!!!!!!!!!!!!!!!!!!!JAVA  =  ${mem} !!!!!!!!!!!!!!!!!!!!!!!!!!" )
  info ( "Puppet server at ${::hostname} with  ${puppet::puppet_server_version} will be installed" )
  package { 'puppetserver':
    ensure => $puppet::puppet_server_version,
  }
  file { '/etc/sysconfig/puppetserver':
    ensure  => file,
    content => template('/home/vagrant/puppet/templates/puppetserver.erb'),
    require => Package['puppetserver'],
  }
  file { '/etc/puppetlabs/puppet/autosign.conf':
    ensure  => file,
    content => template('/home/vagrant/puppet/templates/autosign.conf.erb'),
    require => File['/etc/sysconfig/puppetserver'],
    notify  => Service['puppetserver'],
  }

  service { 'puppetserver':
    ensure => 'running',
    enable => true,
  }
}

