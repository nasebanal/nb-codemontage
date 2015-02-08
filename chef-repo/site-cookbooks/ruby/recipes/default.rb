#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#

## Create work directory

directory node['ruby']['working_dir'] do
	action :create
end


## Copy install

cookbook_file node['ruby']['install_sh_path'] do
	source node['ruby']['install_sh']
	mode "0755"
end


## Install RVM

bash 'install rvm' do
	action :run
	cwd node['ruby']['working_dir']
	code <<-EOH
#{node['ruby']['install_sh_path']} #{node['ruby']['key_url']} #{node['ruby']['recv_keys']} #{node['ruby']['site_url']} 1.26.9 2.1.5 #{node['ruby']['working_dir']}
chown -R codemontage:codemontage /usr/local/rvm
EOH
end


## Install gems

bash 'install gems' do
	action :run
	cwd node['codemontage']['install_dir']
	code <<-EOH
gem install rake -v '10.4.2'
gem install serverspec -v '2.8.2'
EOH
end
