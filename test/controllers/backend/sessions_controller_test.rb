require 'test_helper'

class Backend::SessionsControllerTest < ActionController::TestCase

  setup do
    @admin = create(:admin)
  end

  test "password error return 401" do
    post :create, params: {
      name: 'gamefu',
      password: 'xxxx'
    }
    assert_response 401
  end

  test "session create" do
    post :create, params: {
      name: 'gamefu',
      password: '63292590'
    }
    assert_response :ok
  end

end
