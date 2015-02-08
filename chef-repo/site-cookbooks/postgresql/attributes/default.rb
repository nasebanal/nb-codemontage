## Directory

default['postgres']['working_dir'] = ::File.join(Chef::Config[:file_cache_path], 'postgres')


## File

default['postgres']['create_role'] = 'create_role.sql'
default['postgres']['create_role_path'] = ::File.join( node['postgres']['working_dir'], node['postgres']['create_role'])
