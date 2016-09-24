class puppet (
  $puppet_version = 'installed',
  ) {
  notify { "Puppet version $puppet_version will be installed": }
  package { 'puppetlabs-pc1':
    provider => 'rpm',
    ensure => latest,
	source => "https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm"

  }
  if $is_puppetserver {
    include puppet::server
    }

  else {
    include puppet::client
  }
}
