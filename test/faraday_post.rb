require 'faraday'
require 'yaml'

conn = Faraday.new(:url => 'http://www.example.com')

# post payload as JSON instead of "www-form-urlencoded" encoding:
response = conn.post do |req|
  req.url '/post/here'
  req.headers['Content-Type'] = 'application/json'
  req.body = '{"id":-1,"userId":1,"name":"some-test","createdAt":1356665463287}'
end

puts response.to_yaml
