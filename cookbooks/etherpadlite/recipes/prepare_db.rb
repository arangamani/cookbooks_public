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
#This recipe prepares the database for running etherpad lite with mysql DB
#

rs_utils_marker :begin

bash "update_ruby" do
  cwd "/var/"
  code <<-EOH
    git clone git://github.com/arangamani/ruby.git
    cd ruby
    git checkout "ruby_1_8_7"
    ./configure --prefix=/usr
    make
    make install
    gem install mysql
  EOH
end

begin
#  gem_package "mysql" do
#    action :install
#  end
  Gem.clear_paths
  require 'rubygems'
  require 'mysql'
  con = Mysql.new('localhost', 'root', node[:mysql][:server_root_password], '')

  # Creating the database for etherpad lite
  con.query("create database etherpadlite")
  con.close
  rescue LoadError
    Chef::Log.info("Missing gem 'mysql'")
end

rs_utils_marker :end
