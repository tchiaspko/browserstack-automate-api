# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'browserstack/automate/plan'

# require 'plan'
require 'minitest/reporters'
Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]

require 'minitest/autorun'
#require 'webmock/minitest'
#require 'vcr'

#VCR.configure do |c|
#  c.cassette_library_dir = 'test/fixtures'
#  c.hook_into :webmock
#end

plan = Browserstack::Automate::Plan.new

pp plan
#print plan

puts "Testing Accessing plan's each members"
#print "\n\n", plan.inspect
print "\nautomate_plan: ", plan.automate_plan
print "\nparallel_sessions_running:", plan.parallel_sessions_running
print "\nteam_parallel_sessions_max_allowed", plan.team_parallel_sessions_max_allowed
print "\nparallel_sessions_max_allowed", plan.parallel_sessions_max_allowed
print "\nparallel_sessions_max_allowed: ", plan.queued_sessions
print "\nqueued_sessions_max_allowed: ", plan.queued_sessions_max_allowed

print "\n\n"
puts "Testing plan's print_all method"
print "\n"
plan.print_all
print "\n\n"

