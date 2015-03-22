require 'spec_helper'

describe 'dani-serv::_nginx' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04')
      .converge(described_recipe)
  end

  before do
    stub_command('which nginx').and_return('/usr/sbin/nginx')
  end

  it 'Includes the nginx recipe' do
    expect(chef_run).to include_recipe('nginx')
  end

  it 'Creates the hello_world nginx site' do
    expect(chef_run)
      .to create_template('/etc/nginx/sites-available/hello_world')
  end

  it 'Enables the hello_world nginx site' do
    expect(chef_run).to enable_nginx_site('hello_world')
  end
end
