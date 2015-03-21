require 'spec_helper'

describe 'dani-serv::_hello_world' do
  %w( /srv/hello_world /srv/goodbye_world ).each do |webroot|
    context "when webroot is configured as #{webroot}" do
      let(:chef_run) do
        ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04') do |node|
          node.set['dani-serv']['webroot'] = webroot
        end.converge(described_recipe)
      end

      it "creates #{webroot}" do
        expect(chef_run).to create_directory(webroot)
      end

      it "creates #{webroot}/index.html" do
        expect(chef_run).to create_file("#{webroot}/index.html").with(
          content: /[hH]ello [wW]orld/
        )
      end
    end
  end
end
