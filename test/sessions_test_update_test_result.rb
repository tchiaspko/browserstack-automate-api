# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'browserstack/automate/sessions'
require 'minitest/reporters'
require 'yaml'
Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]

require 'minitest/autorun'

puts "Session: Test get_session_info_by_id(it should return a json with all session info)"
#session_eg=Browserstack::Automate::Sessions.new
#result=session_eg.get_session_info_by_id('3b3ac82334f5450d04eb72dd0e4ee602087efc36')
# print "\nstatus=", result.status
# print "\nhashed_id=", result.hashed_id
# print "\nbuild_name=", result.build_name
# print "\nproject_name", result.project_name
#pp "status=", result.inspect
#print "\n\n"

SESSION_ID='3b3ac82334f5450d04eb72dd0e4ee602087efc36'

puts "Session: Update test result (example group)"
#def update_test_result(session_id:, test_result_status:, reason:)
#Browserstack::Automate::Sessions.new(session_id: '2a94ee7370d9a0f1583097823b99540769298b95', test_result_status: 'failed', reason: 'failed reason')
#Browserstack::Automate::Sessions.new
puts "\n\nSetting status to passed"
session_eg=Browserstack::Automate::Sessions.new
result=session_eg.get_session_info_by_id("#{SESSION_ID}")
result.update_test_result( session_id: "#{SESSION_ID}",
																						 test_result_status: 'passed',
																						 reason: 'passed reason')
result_session=Browserstack::Automate::Sessions.new
result_check=result_session.get_session_info_by_id("#{SESSION_ID}")
pp "status should be passed", result_check.get_session_info_by_id("#{SESSION_ID}").status

#####################################
puts "\n\nSetting status to failed"
session_eg=Browserstack::Automate::Sessions.new
result=session_eg.get_session_info_by_id("#{SESSION_ID}")
result.update_test_result( session_id: "#{SESSION_ID}",
																						 test_result_status: 'failed',
																						 reason: 'failed reason')
result_session=Browserstack::Automate::Sessions.new
result_check=result_session.get_session_info_by_id("#{SESSION_ID}")
pp "status should be failed", result_check.get_session_info_by_id("#{SESSION_ID}").status

#####################################
puts "\n\nSetting status to passed"
session_eg=Browserstack::Automate::Sessions.new
result=session_eg.get_session_info_by_id("#{SESSION_ID}")
result.update_test_result( session_id: "#{SESSION_ID}",
																						 test_result_status: 'passed',
																						 reason: 'passed reason')
result_session=Browserstack::Automate::Sessions.new
result_check=result_session.get_session_info_by_id("#{SESSION_ID}")
pp "status should be passed", result_check.get_session_info_by_id("#{SESSION_ID}").status



print "\n\n"


