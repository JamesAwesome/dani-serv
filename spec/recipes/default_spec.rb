require 'spec_helper'

describe 'dani-serv::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04')
      .converge(described_recipe)
  end

  %w( _users _packages _hello_world _nginx _ssh ).each do |recipe|
    it "Includes the #{recipe} recipe" do
      expect(chef_run).to include_recipe("dani-serv::#{recipe}")
    end
  end
end
