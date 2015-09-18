require 'httparty'
class ExternalApi
  include HTTParty

  def self.my_ip
    req = get 'http://httpbin.org/ip'
    parse = JSON.parse(req.body)
    parse['origin']
  end
end
