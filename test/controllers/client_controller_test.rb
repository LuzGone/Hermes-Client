require "test_helper"

class ClientControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get client_home_url
    assert_response :success
  end
end
