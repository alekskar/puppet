class exit::master ($s_version = installed) {
# package { 'puppetserver':
#    ensure => $s_version
#    notify { "Puppet server at $hostname has been installed": }
# }
  $signdomain = $facts['networking']['domain']
  $autosign_domain = $domain
  file { '/etc/puppetlabs/puppet/autosign.conf':
      content => template('/etc/puppetlabs/code/modules/exit/templates/autosign.conf.erb'),
  }

#if $facts['os']['family'] == 'redhat' {
#  # ...
#}
}

