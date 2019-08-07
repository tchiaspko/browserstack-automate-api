# frozen_string_literal: true

require 'faraday'
require 'yaml'

API_URL = 'https://api.browserstack.com'

conn = Faraday.new(url: API_URL.to_s)
conn.basic_auth(ENV['BROWSERSTACK_USERNAME'], ENV['BROWSERSTACK_ACCESS_KEY'])

# post payload as JSON instead of "www-form-urlencoded" encoding:
response = conn.put do |req|
  req.url '/automate/sessions/2a94ee7370d9a0f1583097823b99540769298b95.json'
  req.headers['Content-Type'] = 'application/json'
  # req.body = '{"id":-1,"userId":1,"name":"some-test","createdAt":1356665463287}'
  req.body = '{"status": "passed", "reason": "some_pass reason"}'
end

puts response.to_yaml
