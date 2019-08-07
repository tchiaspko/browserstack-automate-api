# frozen_string_literal: true

require './test/test_helper'

class Browserstack::Automate::RubyApiTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Browserstack::Automate::Api::VERSION
  end

  # def test_it_does_something_useful
  #  assert true
  # end
end

describe 'Spec-Style Browserstack::Automate::RubyApiTest' do
  it 'has a version number' do
    value(::Browserstack::Automate::RubyApi::VERSION).wont_be_nil
  end

  it 'does something useful' do
    value(4 + 4).must_equal 8
  end
end
