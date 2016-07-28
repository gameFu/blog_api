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

end
