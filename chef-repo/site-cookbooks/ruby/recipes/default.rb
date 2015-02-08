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
	mode "0777"
end


## Copy install sh

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
chown -R codemontage:codemontage /opt/chef
EOH
end


## Install gems

bash 'install gems' do
	user 'codemontage'
	action :run
	environment "HOME" => node['ruby']['home_dir']
	code <<-EOH
source ~/.bash_profile
gem install rake -v '10.4.2'
gem install rails -v '4.2.0'
gem install serverspec -v '2.8.2'
gem install highline -v '1.6.21'
EOH
end

