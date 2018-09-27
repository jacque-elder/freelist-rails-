require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | Freelist"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | Freelist"
  end

end
