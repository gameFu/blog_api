require 'test_helper'

class Backend::AdminsControllerTest < ActionController::TestCase
  setup do
    current_admin
  end

  test "admin update" do
    admin_put :update, params: { id: @admin.id, admin: {name: "fugeng"} }
    assert_equal "fugeng", response_json['data']["attributes"]["name"]
    debugger
    assert_not_equal "", response_json['data']["attributes"]["avatar"]
  end

  test "request fail with admin no login" do
    put :update, params: { id: @admin.id, admin: {name: "fugeng"} }
    assert_response 401
  end

end
