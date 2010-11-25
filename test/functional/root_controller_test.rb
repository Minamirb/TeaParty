require 'test_helper'

class RootControllerTest < ActionController::TestCase
  test "should get menu" do
    get :menu
    assert_response :success
  end

end
