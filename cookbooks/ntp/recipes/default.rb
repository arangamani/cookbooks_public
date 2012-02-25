#
# Cookbook Name:: ntp
# Recipe:: default
#
# Copyright 2012, Kannan Rightscale
#
# All rights reserved - Do Not Redistribute
#

package "ntp" do
	action  [:install]
end

template "/etc/ntp.conf" do
	source  "ntp.conf.erb"
	variables( :ntp_server => "time.nist.gov" )
end

service "nttpd" do
	action [:enable,:start]
end
