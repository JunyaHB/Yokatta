require 'test_helper'

class OauthControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get oauth_new_url
    assert_response :success
  end

  test "should get create" do
    get oauth_create_url
    assert_response :success
  end

  test "should get destroy" do
    get oauth_destroy_url
    assert_response :success
  end

end
