# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'browserstack/automate/sessions'
require 'minitest/reporters'
require 'yaml'
Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]

require 'minitest/autorun'

## =================
SESSION_ID = '3b3ac82334f5450d04eb72dd0e4ee602087efc36'
puts 'Session: Test get_build_id (it should return the build id from a session id )'
session = Browserstack::Automate::Sessions.new
build_id = session.get_build_id(session_id: SESSION_ID.to_s)

print "expected build_id should be \t6c713a62c109fdb22328a2eccb7da61ed130a42e\n"
print "actual build_id = \t\t", build_id

print "\n\n"
## =================

SESSION_ID2 = '2a94ee7370d9a0f1583097823b99540769298b95'
puts 'Session: Test get_build_id (it should return the build id from a session id )'
session = Browserstack::Automate::Sessions.new
build_id = session.get_build_id(session_id: SESSION_ID2.to_s)

print "expected build_id should be \t885e4d1b2b3e71d009c9475c688a740105a79277\n"
print "actual build_id = \t\t", build_id

print "\n\n"
## =================

print 'build_url=', session.get_browserstack_build_url(session_id: SESSION_ID2.to_s)
print "\n\n"
print 'session_url=', session.get_browserstack_session_url(session_id: SESSION_ID2.to_s)
print "\n\n"
