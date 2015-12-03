ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'test_time_tracking'

# Stubbing and mocking with Mocha
require 'mocha/mini_test'

class ActiveSupport::TestCase
  include TestTimeTracking 
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def login
    sign_in User.first
  end
end

class ActionController::TestCase
  include Devise::TestHelpers
end
