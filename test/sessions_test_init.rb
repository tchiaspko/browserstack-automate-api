# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'browserstack/automate/sessions'
require 'minitest/reporters'
require 'yaml'
Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]

require 'minitest/autorun'

puts 'Session: Test get_session_info_by_id(it should return a json with all session info)'
session_id_info = Browserstack::Automate::Sessions.new
# pp session_id_info.to_yaml
result = session_id_info.get_session_info_by_id('3b3ac82334f5450d04eb72dd0e4ee602087efc36')
# pp "yaml=", result.to_yaml
pp 'result=', result
pp 'status=', result.status
pp 'hashed_id=', result.hashed_id
pp 'build_name=', result.build_name
pp 'project_name', result.project_name
# pp "status=", result.inspect
print "\n\n"

exit 0
