module JsonWebTokenAble
  extend ActiveSupport::Concern

  def to_jwt(exp = 1.months.from_now.to_i)
    playload = {
      self.class.name.downcase => {
        user_id: self.id
      },
      "exp" => exp
    }
    JWT.encode playload, ENV['jwt_secret'], ENV['jwt_algorithm']
  end

end
