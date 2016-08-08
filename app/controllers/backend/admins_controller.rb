class Backend::AdminsController < Backend::ApplicationController

  def update
    if current_admin.update admin_params
      response_json current_admin
    else
      raise LogicError, '更新失败'
    end
  end

  private
  def admin_params
    params.require(:admin).permit(:name, :avatar, :password, :password_confirmation)
  end

end
