require 'spec_helper'

describe 'dani-serv::_users' do
   let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04')
      .converge(described_recipe)
  end

  it 'creates the dani group' do
    expect(chef_run).to create_group('dani')
  end

  %w( foo bar ).each do |password|
    context "When password is set to #{password}" do
      let(:chef_run) do
        ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04') do |node|
          node.set['dani-serv']['password'] = password
        end.converge(described_recipe)
      end

      it "creates a user called dani with password #{password}" do
        expect(chef_run).to create_user('dani').with(
          shell: '/bin/bash',
          home: '/home/dani',
          gid: 'dani',
          password: password,
          supports: { manage_home: true }
        )
      end
    end
  end
end
