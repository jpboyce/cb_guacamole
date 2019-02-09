#
# Cookbook:: cb_guacamole
# Recipe:: 01_staging
#
# The MIT License (MIT)
#
# Copyright:: 2019, Jesse Boyce
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# Guacamole server
# Download server tar file from source location
remote_file "/tmp/guacamole-server-#{node['cb_guacamole']['server']['version']}.tar.gz" do
  source node['cb_guacamole']['server']['url']
  owner 'root'
  group 'root'
  mode '0755'
  checksum node['cb_guacamole']['server']['checksum']
  action :create
end

# Make guacamole server directory
directory '/etc/guacamole' do
  mode '0755'
  action :create
end

# Unzip tar file and copy to final directory
# Don't run if configure file is already there
bash 'extract_guacamole' do
  cwd '/tmp'
  code <<-EOH
  tar -xzf guacamole-server-#{node['cb_guacamole']['server']['version']}.tar.gz
  EOH
  action :run
  not_if { ::File.exists?("/tmp/guacamole-server-#{node['cb_guacamole']['server']['version']}/configure") }
end

#Guacamole Client
# Download client tar file
=begin
remote_file "/tmp/guacamole-client-#{node['cb_guacamole']['client']['version']}.tar.gz" do
  source node['cb_guacamole']['client']['url']
  owner 'root'
  group 'root'
  mode '0755'
  checksum node['cb_guacamole']['client']['checksum']
  action :create
end
=end
