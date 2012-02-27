#
# Cookbook Name:: etherpadlite
# Recipe:: prepare_db
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
#This recipe stops the running instance of etherpad lite
#

rs_utils_marker :begin

mysql_connection_info = {:host => "localhost", :username => 'root', :password => node['mysql']['server_root_password']}


begin
  gem_package "mysql" do
    action :install
  end
  Gem.clear_paths  
  require 'mysql'
  m=Mysql.new("localhost","root",node['mysql']['server_root_password']) 

  if m.list_dbs.include?("etherpadlite") == false
    # create etherpad-lite database
    mysql_database 'etherpadlite' do
      connection mysql_connection_info
      action :create
      notifies :create, "template[/var/etherpad-lite/settings.json]"
    end

    # create etherpad-lite user
    mysql_database_user 'etherpadlite' do
      connection mysql_connection_info
      password node[:etherpadlite][:db_password]
      action :create
    end

    # Grant etherpad-lite
    mysql_database_user 'etherpadlite' do
      connection mysql_connection_info
      password node[:etherpadlite][:db_password]
      database_name 'etherpadlite'
      host 'localhost'
      privileges [:select,:update,:insert,:create,:drop,:delete]
      action :grant
    end
  end
rescue LoadError
  Chef::Log.info("Missing gem 'mysql'")
end

rs_utils_marker :end
