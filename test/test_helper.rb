ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  include Backend::JsonWebTokenHelper

  def response_json
    ActiveSupport::JSON.decode @response.body
  end

  # Add more helper methods to be used by all tests here...
end
