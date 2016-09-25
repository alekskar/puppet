# this class setup puppet server
class puppet::server inherits puppet {

  $autosign_domain = $::domain
  $mem = $::mem_to_allocate
  info ( "Puppet server at ${::hostname} with  ${puppet::puppet_server_version} has been installed" )
  package { 'puppetserver':
    ensure => $puppet::puppet_server_version,
  }
  file { '/etc/sysconfig/puppetserver':
    ensure  => file,
    content => template('/root/puppet/templates/puppetserver.erb'),
    require => Package['puppetserver'],
  }
  file { '/etc/puppetlabs/puppet/autosign.conf':
    ensure  => file,
    content => template('/root/puppet/templates/autosign.conf.erb'),
    require => File['/etc/sysconfig/puppetserver'],
    notify  => Service['puppetserver'],
  }

  service { 'puppetserver':
    ensure  => 'running',
    enable  => true,
    require => File['/etc/sysconfig/puppetserver'],

  }

  exec { 'update_path':
    command  => 'source /root/.bash_profile',
    require  => Package['puppetserver'],
#    onlyif   => 'puppet -V | grep ^$',
  }

}

