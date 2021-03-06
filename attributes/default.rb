#
# Cookbook:: cb_guacamole
# Recipe:: default
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

# Prerequisite yum packages
default['cb_guacamole']['packages']['epel'] = %w( epel-release )
default['cb_guacamole']['packages']['gcc'] = %w( gcc )
default['cb_guacamole']['packages']['required'] = %w( cairo-devel libjpeg-turbo-devel libjpeg-devel libpng-devel uuid-devel )
default['cb_guacamole']['packages']['optional'] = %w( ffmpeg-devel freerdp-devel pango-devel libssh2-devel libtelnet-devel libvncserver-devel openssl-devel libwebp-devel )

# Guacamole source
default['cb_guacamole']['server']['version'] = '1.0.0'
default['cb_guacamole']['server']['url'] = "http://apache.org/dyn/closer.cgi?action=download&filename=guacamole/#{node['cb_guacamole']['server']['version']}/source/guacamole-server-#{node['cb_guacamole']['server']['version']}.tar.gz"
default['cb_guacamole']['server']['checksum'] = 'e50d513f5abb330722f2380d9cd5232a8c8055e646e0ec3bd394a72f46223556'
default['cb_guacamole']['server']['version'] = '1.0.0'
# default['cb_guacamole']['client']['url'] = "http://apache.org/dyn/closer.cgi?action=download&filename=guacamole/#{node['cb_guacamole']['server']['version']}/source/guacamole-client-#{node['cb_guacamole']['client']['version']}.tar.gz"
default['cb_guacamole']['client']['url'] = "http://apache.org/dyn/closer.cgi?action=download&filename=guacamole/#{node['cb_guacamole']['server']['version']}/binary/guacamole-#{node['cb_guacamole']['server']['version']}.war"
default['cb_guacamole']['client']['checksum'] = 'd0519b7706bc3df100bc7b4c0e4eab9404bf5548aab62ccf0f57d2572c736133'

# Guacd settings
default['cb_guacamole']['guacd']['hostname'] = 'localhost'
default['cb_guacamole']['guacd']['port'] = '4822'
default['cb_guacamole']['guacd']['ssl'] = 'true'
