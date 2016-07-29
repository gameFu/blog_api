class Backend::SessionsController < Backend::ApplicationController
  skip_before_action :authenticate_admin_request

  def create
    admin = Admin.find_by_name(params[:name])
    if admin && admin.authenticate(params[:password])
      render json: { jwt: admin.to_jwt }
    else
      raise AuthError, '没有权限'
    end
  end

end
