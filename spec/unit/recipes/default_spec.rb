#
# Cookbook:: node_3
# Spec:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'node_3::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '16.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'Should install nginx' do
      expect(chef_run).to install_package 'nginx'
    end
    it 'enables the nginx service' do
      expect(chef_run).to enable_service 'nginx'
  end

  it 'starts the nginx service' do
    expect(chef_run).to start_service 'nginx'
end
  it 'should install nodejs from a recipe' do
    expect(chef_run). to include_recipe 'nodejs'
  end
  it 'should create proxy.conf template in /etc/nginx/sites-available' do
    expect(chef_run).to create_template "/etc/nginx/sites-available/proxy.conf"

  end
#  it 'should create a symlink of proxy.conf from sites available ti sites-enabled' do
#    expect(chef_run).to create_link("/etc/nginx/sites-available/proxy.conf").with_link_type(:symbolic)
#  end
#  it 'should delete the symlink from the default config' do
#    expect(chef_run).to delete_link "/etc/nginx/sites-enabled/default"

#  end
  it 'should create a symlink of proxy.conf from sites-available to sites-enabled' do
  expect(chef_run).to create_link("/etc/nginx/sites-enabled/proxy.conf").with_link_type(:symbolic)
end
it 'should delete the symlink from the default config in sites-enabled' do
  expect(chef_run).to delete_link "/etc/nginx/sites-enabled/default"
end
it 'runs apt-get update' do
  expect(chef_run).to update_apt_update 'update_sources'
end

end
end
