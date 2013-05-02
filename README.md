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

Chef 0.10.0 or higher required (for Chef environment use)

Platform
--------

* Ubuntu-12.04+
* Fedora-17+

Cookbooks
---------

The following cookbooks are dependencies:

* database
* keystone
* mysql
* openstack-common

Recipes
=======

api
------

- Installs the openstack-network API server

ovs
---

- Installs the OVS L2 plugin

keystone-registration
---------------------

- Registers the OpenStack Network API endpoint and service user with Keystone

db
--

- Creates the OpenStack Network database

Attributes
==========

TODO

Templates
=========

* `glance-api-paste.ini.erb` - Paste config for glance-api middleware
* `glance-api.conf.erb` - Config file for glance-api server
* `glance-registry-paste.ini.erb` - Paste config for glance-registry middleware
* `glance-registry.conf.erb` - Config file for glance-registry server
* `glance-scrubber.conf.erb` - Config file for glance image scrubber service
* `policy.json.erb` - Configuration of ACLs for glance API server

License and Author
==================

Author:: Jay Pipes (<jaypipes@gmail.com>)

Copyright 2013, AT&T

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
