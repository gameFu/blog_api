module Backend::JsonWebTokenHelper
  def jwt_decode(token)
    begin
      JWT.decode token, ENV['jwt_secret'], ENV['jwt_algorithm']
    rescue
      raise AuthError, "token失效"
    end
  end

  def jwt_user_id(token, auth_type = "admin")
    jwt_decode(token)[0][auth_type]["user_id"]
  end

end
