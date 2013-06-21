platform_options["quantum_lb_packages"].each do |pkg|
   package pkg do
     action :install
   end
end
directory "/etc/quantum/plugins/services/agent_loadbalancer/" do
  action :create
  owner node["openstack-network"]["user"]
  group ["openstack-network"]["group"]
  recursive true
end

template "/etc/quantum/plugins/services/agent_loadbalancer/lbaas_agent.ini" do
  source "lbaas_agent.ini.erb"
  notifies :restart, "service[quantum-server]", :immediately
end
