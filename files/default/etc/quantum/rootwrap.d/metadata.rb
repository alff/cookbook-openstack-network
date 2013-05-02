name              "openstack-network"
maintainer        "Jay Pipes <jaypipes@gmail.com>"
license           "Apache 2.0"
description       "Installs and configures the OpenStack Network API Service and various agents and plugins"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "2013.1.0"
recipe            "openstack-network::api", "Installs packages required for a OpenStack Network API server"
recipe            "openstack-network::ovs", "Installs packages required for the OVS plugin to work"
recipe            "openstack-network::db", "Creates the OpenStack Network database"
recipe            "openstack-network::keystone_registration", "Registers OpenStack Networtk endpoints and service user with Keystone"

%w{ ubuntu fedora redhat centos }.each do |os|
  supports os
end

depends           "database"
depends           "keystone", ">= 2012.2.1"
depends           "mysql"
depends           "openstack-common", ">= 0.1.7"
