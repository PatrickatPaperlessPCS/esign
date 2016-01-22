require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get baa" do
    get :baa
    assert_response :success
  end

end
