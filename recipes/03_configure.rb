#
# Cookbook:: cb_guacamole
# Recipe:: 03_config
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

# Create guacamole.properties file off template and populate
template '/etc/guacamole/guacamole.properties' do
  source 'guacamole.properties.erb'
  mode '0644'
  variables(guacd_hostname: node['cb_guacamole']['guacd']['hostname'],
    guacd_port: node['cb_guacamole']['guacd']['port'])
  action :create
end

# Placeholder for logback.xml file
template '/etc/guacamole/logback.xml' do
  source 'logback.xml.erb'
  mode '0644'
  action :create
end

# Placeholder for user auth

# Placeholder for guacd SSL

# Put client file in its place
remote_file '/var/lib/tomcat/webapps/guacamole.war' do
  source node['cb_guacamole']['client']['url']
  owner 'tomcat'
  group 'tomcat'
  mode '0644'
  action :create_if_missing
end
