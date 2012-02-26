#
# Cookbook Name:: etherpadlite
# Recipe:: prepare_pad
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

rs_utils_marker :begin

include_recipe "node::default"

bash "get_etherpadlite_source" do
  cwd "/var/"
  code <<-EOH
    git clone git://github.com/arangamani/etherpad-lite.git
    cd etherpad-lite
    git checkout "for_cooking"
  EOH
end

bash "etherpadlite_install_deps" do
  user "root"
  cwd "/var/etherpad-lite/"
  code <<-EOH
    sh bin/installDeps.sh
  EOH
end

rs_utils_marker :end
