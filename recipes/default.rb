#
# Cookbook Name:: revealcloud
# Recipe:: default
#
# Copyright 2012, CopperEgg
#
# Redistribution Encouraged
#

script "revealcloud_install" do
  interpreter "bash"
  user "root"
  code "curl http://#{node[:copperegg][:apikey]}@api.copperegg.com/chef.sh | RC_TAG=\"#{node[:copperegg][:tags]}\" RC_LABEL=\"#{node[:copperegg][:label]}\" RC_PROXY=\"#{node[:copperegg][:proxy]}\" sh"
  not_if { File.exists?('/etc/init.d/revealcloud') }
end

service "revealcloud" do
  supports :start => true, :stop => true, :restart => true
  action [ :enable, :start ]
end