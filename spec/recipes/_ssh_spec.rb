require 'spec_helper'

describe 'dani-serv::_ssh' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04')
      .converge(described_recipe)
  end

  it 'should install ssh' do
    expect(chef_run).to install_package('ssh')
  end
end
