ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  
  def sign_in_as (usuario, password)
    post login_path, params:{ session: { email: usuario.email, password: password } }
  end

  # Add more helper methods to be used by all tests here...
end
