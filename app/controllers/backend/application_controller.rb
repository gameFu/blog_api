class Backend::ApplicationController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include Backend::JsonWebTokenHelper
  rescue_from LogicError, with: :logic_error_handle
  rescue_from AuthError, with: :auth_error_handle
  attr_reader :current_admin
  before_action :authenticate_admin_request

  def logic_error_handle(error)
    response_with_errors error
  end

  def response_json(data, status=200)
    render json: data, status: status
  end

  def response_with_errors(error, status=400)
    render json: {errors: error}, status: status
  end

  def auth_error_handle(error)
    response_with_errors error, 401
  end

  def current_admin
    @current_admin ||= login_user
  end

  def login_admin
    authenticate_with_http_token do |token, _options|
      decode_token = (JWT.decode token, ENV['jwt_secret'], true, { :algorithm => ENV['jwt_algorithm'] })
      @current_admin = Admin.find(decode_token[0]['admin']['user_id'])
    end
    @current_admin
  end

  def authenticate_admin_request
    raise AuthError, '授权错误' unless login_admin
  end

end
