require 'spec_helper'

describe 'dani-serv::_packages' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04')
      .converge(described_recipe)
  end

  %w( git vim strace ).each do |pkg|
    it "installs #{pkg}" do
      expect(chef_run).to include_package(pkg)
    end
  end
end
