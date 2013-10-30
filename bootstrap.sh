#!/bin/bash

set -e

# If wget is installed then assume that the machine is already bootstrapped
if [ ! -f /etc/bootstrapped ]; then
  echo Running Bootstrap
  apt-get -qq update && apt-get -qq install -y wget

  cd /tmp
  wget -nc -nv http://apt.puppetlabs.com/puppetlabs-release-precise.deb && dpkg -i puppetlabs*.deb

  apt-get -qq update && apt-get -qq install -y puppet-common

  touch /etc/bootstrapped
fi
echo Copying Puppet Files
cp -Rv /vagrant/puppet/modules /vagrant/puppet/manifests /etc/puppet

echo Running Puppet
puppet apply /etc/puppet/manifests/site.pp
