#
# Cookbook Name:: etherpadlite
# Recipe:: start_pad
#
# Copyright 2012, Arangamanikkannan Manickam
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
#This recipe installs the prerequisites for etherpad lite and start the pad
#as a daemon instead of a process.
#

rs_utils_marker :begin

#Install daemonize for running the pad as a daemon

case node[:platform]
  when "centos", "redhat", "fedora"
    package "daemonize"
  when "debian", "ubuntu"
    bash "clone_daemonize" do
      cwd "/var/"
      code <<-EOH
        git clone git://github.com/arangamani/daemonize.git
	cd daemonize
        git checkout "for_cooking"
      EOH
    end
    
    bash "install_daemonize" do
      cwd "/var/daemonize/"
      code <<-EOH
        ./configure --prefix=/usr
        make
        make install
      EOH
    end
end

#STARTING THE PAD
#Running the pad as in a script doesn't let the script to exit and hence the script fails. 
#Daemonizing the pad and leaving the pid in a file allows us to kill the server whenever possible. 
#Absolute path of node should be used here.
#

bash "start_pad" do
  cwd "/var/etherpad-lite/node"
  code <<-EOH
    touch /var/log/#{node[:etherpadlite][:logfile]}
    daemonize -o /var/log/#{node[:etherpadlite][:logfile]} -c /var/etherpad-lite/node -p /var/etherpad-lite/etherpadlited /usr/bin/node /var/etherpad-lite/node/server.js
  EOH
end

rs_utils_marker :end
