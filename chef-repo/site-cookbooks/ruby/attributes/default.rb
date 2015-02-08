## Repository

default['ruby']['site_url'] = 'https://get.rvm.io'
default['ruby']['key_url'] = 'hkp://keys.gnupg.net'
default['ruby']['recv_keys'] = '409B6B1796C275462A1703113804BB82D39DC0E3'


## Directory

default['ruby']['home_dir'] = '/home/codemontage'
default['ruby']['working_dir'] = ::File.join(Chef::Config[:file_cache_path], 'ruby')


## File

default['ruby']['install_sh'] = 'install_ruby.sh'
default['ruby']['install_sh_path'] = ::File.join(node['ruby']['working_dir'], node['ruby']['install_sh'])
default['ruby']['serverspec_init'] = 'serverspec_init.txt'
default['ruby']['serverspec_init_path'] = ::File.join(node['ruby']['working_dir'], node['ruby']['serverspec_init'])
