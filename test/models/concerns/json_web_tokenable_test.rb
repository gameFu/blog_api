require 'test_helper'

class Concerns::JsonWebTokenableTest < ActiveSupport::TestCase

  test "to_jwt" do
    admin = create(:admin)
    token = admin.to_jwt
    assert_equal admin.id, jwt_user_id(token)
  end

end
