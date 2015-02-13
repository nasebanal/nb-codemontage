#
# Cookbook Name:: codemontage
# Recipe:: default
#
# Copyright 2015, NASEBANAL
#
# All rights reserved - Do Not Redistribute
#


## Download Code Montage

bash 'download codemontage' do
	action :run
	cwd node['codemontage']['install_dir']
	code <<-EOH
git clone https://github.com/CodeMontageHQ/codemontage.git
chmod -R 777 codemontage
chown -R codemontage:codemontage codemontage
gem install rake -v '10.3.2'
EOH
end


## Copy database.yml

template '/opt/codemontage/config/database.yml' do
	source 'database.yml'
	owner 'codemontage'
	group 'codemontage'
	mode '0666'
end


## Install Code Montage

bash 'install codemontage' do
	user 'codemontage'
	action :run
	environment "HOME" => "/home/codemontage"
	cwd node['codemontage']['home_dir']
	code <<-EOH
source ~/.bash_profile
bundle install
rake db:create
rake db:migrate
rake db:seed
EOH
end
