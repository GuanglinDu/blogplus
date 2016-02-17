require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert assigns(:time)
    assert_select 'li', minimum: 4
    assert_select 'h3', "Notes:"
  end
end
