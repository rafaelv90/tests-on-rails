require 'timecop'
require_relative '../external_api'


RSpec.describe ExternalApi do

  context 'when call my_ip' do
    it 'should get my ip' do
      stub_request(:get, "http://httpbin.org/ip").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => '{"origin": "192.168.1.1"}', :headers => {})

      expect(ExternalApi.my_ip).to eq '192.168.1.1'
    end
  end
end
