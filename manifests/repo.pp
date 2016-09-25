# this class setup the repo for puppet
class puppet::repo {
  package { 'puppetlabs-release-pc1-el-7.noarch.rpm':
      provider        => 'rpm',
      install_options => ['-Uvh'],
      source          => 'https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm',
  }
}
