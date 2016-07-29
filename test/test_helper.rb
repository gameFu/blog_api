ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  include Backend::JsonWebTokenHelper

  def response_json
    ActiveSupport::JSON.decode @response.body
  end

  def current_admin
    @admin ||= create(:admin)
  end

  %w(get post delete put).each do |method|
    define_method "admin_#{method}" do |action, *params|
      request.env['HTTP_AUTHORIZATION'] = "Token token=#{current_admin.to_jwt}"
      send method, action, *params
    end
  end


  # Add more helper methods to be used by all tests here...
end
