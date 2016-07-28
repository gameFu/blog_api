class Backend::ApplicationController < ApplicationController
  include Backend::JsonWebTokenHelper
  rescue_from LogicError, with: :logic_error_handle
  rescue_from AuthError, with: :auth_error_handle

  def logic_error_handle(error)
    response_with_errors error
  end


  def response_with_errors(error, status=400)
    render json: {errors: error}, status: status
  end

  def auth_error_handle(error)
    response_with_errors error, 401
  end

  def current_user
    @current_user ||= login_user
  end

  def login_user
    authenticate_with_http_token do |token, _options|
      if decode_token = JWT.decode token, ENV['jwt_secret'], true, { :algorithm => ENV['jwt_algorithm'] }
        @current_user = Admin.find(decode_token[0]['admin']['user_id'])
      else
        raise AuthError, '授权错误'
      end
    end
    @current_user
  end

end
