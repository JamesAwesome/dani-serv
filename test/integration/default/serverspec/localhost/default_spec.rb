require 'spec_helper'
require 'net/http'

describe 'dani-serv::default' do
  describe user('dani') do
    it { should exist }
  end

  describe port(22) do
    it { should be_listening.on('0.0.0.0') }
  end

  describe port(80) do
    it { should be_listening.on('0.0.0.0') }

    it 'Should return 200 and "hello world" on a GET request' do
      res = Net::HTTP.get_response(URI('http://127.0.0.1:80'))
      expect(res.code).to eq('200')
      expect(res.body).to match(/[hH]ello [wW]orld/)
    end
  end
end
