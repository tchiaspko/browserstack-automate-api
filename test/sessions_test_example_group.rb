# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'browserstack/automate/sessions'
require 'yaml'
# require 'minitest/reporters'
# Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]
# require 'minitest/autorun'

# puts "Session: Test get_session_info_by_id(it should return a json with all session info)"
# session_eg=Browserstack::Automate::Sessions.new
# result=session_eg.get_session_info_by_id('3b3ac82334f5450d04eb72dd0e4ee602087efc36')
# print "\nstatus=", result.status
# print "\nhashed_id=", result.hashed_id
# print "\nbuild_name=", result.build_name
# print "\nproject_name", result.project_name
# pp "status=", result.inspect
# print "\n\n"

## =================
# Init to original condition (i.e. Unmarked)
puts 'Session: Update test result (example group). current test status is unmarked/done'
puts 'setting up test. Status cannot be changed back to done/unmarked from pass or fail'
# SESSION_ID="2679d05b53e3b77564d8bba8e4443d1fe9371a7d"
session_id = '97ee57c2e877aa25b6df8ba8462dfae0519569b0'
session_eg = Browserstack::Automate::Sessions.new
result = session_eg.get_session_info_by_id(session_id.to_s)
# result.update_test_result( session_id: "#{SESSION_ID}",
#                                             test_result_status: 'done',
#                                             reason: 'CLIENT_STOPPED_SESSION')
puts 'setup is done. executing test'
result.update_test_result_example_group(session_id: session_id.to_s,
                                        test_result_status: 'passed',
                                        reason: 'passed reason')
puts 'test execution is done. verifing result'
result_session = Browserstack::Automate::Sessions.new
result_check = result_session.get_session_info_by_id(session_id.to_s)
pp 'status should be passed', result_check.get_session_info_by_id(session_id.to_s).status

## ==== setup / Init test result to passed =====

session_id = '3b3ac82334f5450d04eb72dd0e4ee602087efc36'
puts 'Init test result to passed'
init_session = Browserstack::Automate::Sessions.new
init_result = init_session.get_session_info_by_id(session_id.to_s)
init_result.update_test_result(session_id: session_id.to_s,
                               test_result_status: 'passed',
                               reason: 'passed reason')

# def update_test_result(session_id:, test_result_status:, reason:)
# Browserstack::Automate::Sessions.new(session_id: '2a94ee7370d9a0f1583097823b99540769298b95',
#                                      test_result_status: 'failed',
#                                      reason: 'failed reason')
# Browserstack::Automate::Sessions.new
puts "\n\nSetting status to passed"
session_eg = Browserstack::Automate::Sessions.new
result = session_eg.get_session_info_by_id(session_id.to_s)
result.update_test_result_example_group(session_id: session_id.to_s,
                                        test_result_status: 'passed',
                                        reason: 'passed reason')
result_session = Browserstack::Automate::Sessions.new
result_check = result_session.get_session_info_by_id(session_id.to_s)
pp 'status should be passed', result_check.get_session_info_by_id(session_id.to_s).status

#####################################
puts "\n\nSetting status to failed"
session_eg = Browserstack::Automate::Sessions.new
result = session_eg.get_session_info_by_id(session_id.to_s)
result.update_test_result_example_group(session_id: session_id.to_s,
                                        test_result_status: 'failed',
                                        reason: 'failed reason')
result_session = Browserstack::Automate::Sessions.new
result_check = result_session.get_session_info_by_id(session_id.to_s)
pp 'status should be failed', result_check.get_session_info_by_id(session_id.to_s).status

#####################################
puts "\n\nSetting status to passed"
session_eg = Browserstack::Automate::Sessions.new
result = session_eg.get_session_info_by_id(session_id.to_s)
result.update_test_result_example_group(session_id: session_id.to_s,
                                        test_result_status: 'passed',
                                        reason: 'passed reason')
result_session = Browserstack::Automate::Sessions.new
result_check = result_session.get_session_info_by_id(session_id.to_s)
pp 'status should be failed', result_check.get_session_info_by_id(session_id.to_s).status

print "\n\n"
