#
# Cookbook Name:: openstack-network
# Recipe:: identity_registration
#
# Copyright 2012, Rackspace US, Inc.
# Copyright 2012-2013, AT&T Services, Inc.
# Copyright 2013, Opscode, Inc.
# Copyright 2013, Alex Khalkuziev <akhalkuziev@mirantis.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require "uri"

class ::Chef::Recipe
  include ::Openstack
end

identity_admin_endpoint = endpoint "identity-admin"
bootstrap_token = secret "secrets", "openstack_identity_bootstrap_token"
auth_uri = ::URI.decode identity_admin_endpoint.to_s
quantum_api_endpoint = endpoint "network-api"
service_pass = service_password "neutron"
region = node["openstack"]["network"]["region"]
service_tenant_name = node["openstack"]["network"]["service_tenant_name"]
service_user = node["openstack"]["network"]["service_user"]
service_role = node["openstack"]["network"]["service_role"]

openstack_identity_register "Register Network Service" do
  auth_uri auth_uri
  bootstrap_token bootstrap_token
  service_name node["openstack"]["network"]["service_name"]
  service_type node["openstack"]["network"]["service_type"]
  service_description node["openstack"]["network"]["description"]
  endpoint_region region
  endpoint_adminurl ::URI.decode quantum_api_endpoint.to_s
  endpoint_internalurl ::URI.decode quantum_api_endpoint.to_s
  endpoint_publicurl ::URI.decode quantum_api_endpoint.to_s

  action :create_service
end

openstack_identity_register "Register Network Endpoint" do
  auth_uri auth_uri
  bootstrap_token bootstrap_token
  service_name node["openstack"]["network"]["service_name"]
  service_type node["openstack"]["network"]["service_type"]
  service_description node["openstack"]["network"]["description"]
  endpoint_region region
  endpoint_adminurl ::URI.decode quantum_api_endpoint.to_s
  endpoint_internalurl ::URI.decode quantum_api_endpoint.to_s
  endpoint_publicurl ::URI.decode quantum_api_endpoint.to_s

  action :create_endpoint
end

openstack_identity_register "Register Service Tenant" do
  auth_uri auth_uri
  bootstrap_token bootstrap_token
  tenant_name service_tenant_name
  tenant_description "Service Tenant"

  action :create_tenant
end

openstack_identity_register "Register Network Service User" do
  auth_uri auth_uri
  bootstrap_token bootstrap_token
  tenant_name service_tenant_name
  user_name service_user
  user_pass service_pass

  action :create_user
end

openstack_identity_register "Grant service Role to Network Service User for Network Service Tenant" do
  auth_uri auth_uri
  bootstrap_token bootstrap_token
  tenant_name service_tenant_name
  user_name service_user
  role_name service_role

  action :grant_role
end
