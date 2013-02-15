#
# Cookbook Name:: curl
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "libcurl3" do
  action [:install]
end

package "libcurl3-dev" do
  action [:install]
end

package "libcurl3-openssl-dev" do
	action [:install]
end

package "libcurl3-gnutls-dev" do
	action [:install]
end
