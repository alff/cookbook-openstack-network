Description
===========

This cookbook installs the **OpenStack Network** service (formerly project-named Quantum)
as part of a Chef reference deployment of OpenStack.

More information about the OpenStack Network service is available
[here](http://docs.openstack.org/trunk/openstack-network/admin/content/index.html)

Usage
=====

OpenStack Network's design is modular, with plugins available that handle L2 and
L3 networking for various hardware vendors and standards.

Requirements
============

Chef 11.4.4 or higher required (for Chef environment use)

Cookbooks
---------

The following cookbooks are dependencies:

* database
* openstack-identity
* mysql or postgresql
* openstack-common `>= 2.0.0`

Recipes
=======

server
------

- Installs the openstack-network API server

dhcp\_agent
--------

- Installs the DHCP agent

l3\_agent
--------

- Installs the L3 agent and metadata agent

Identity-registration
---------------------

- Registers the OpenStack Network API endpoint and service user with Keystone

db
--

- Creates the OpenStack Network database

openvswitch
-----------

- Installs the OVS L2 plugin

balancer
--------

- Install and setup loadbalancer service


Attributes
==========

TODO

Templates
=========

* `api-paste.ini.erb` - Paste config for OpenStack Network server
* `quantum.conf.erb` - Config file for OpenStack Network server
* `policy.json.erb` - Configuration of ACLs for glance API server
* `metadata_agent.ini.erb` - Configuration for metadata agent
* `lbaas_agent.ini.erb` - Configuration for lbaas agent
* `l3_agent.ini.erb` - Configuration for l3 agent
* `dhcp_agent.ini.erb` - Configuration for DHCP agent

License and Author
==================

License and Author
==================

|                      |                                                    |
|:---------------------|:---------------------------------------------------|
| **Authors**          |  Alan Meadows (<alan.meadows@gmail.com>)           |
|                      |  Jay Pipes (<jaypipes@gmail.com>)                  |
|                      |  Ionut Artarisi (<iartarisi@suse.cz>)              |
|                      |  Alex Khalkuziev (<master.alff@gmail.com>)         |
|                      |                                                    |
| **Copyright**        |  Copyright (c) 2013, AT&T Services, Inc.           |
|                      |  Copyright (c) 2013, SUSE Linux GmbH               |
|                      |  Copyright (c) 2012, Rackspace US, Inc.            |
|                      |  Copyright (c) 2013, Mirantis IT                   |

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
