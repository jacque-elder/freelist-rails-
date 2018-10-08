require 'test_helper'

class ServicesControllerTest < ActionDispatch::IntegrationTest

  def setup
  	@service = services(:one)
    @user = users(:michael)
    @other_user = users(:archer)
  end

  test "should redirect edit when not logged in" do
    get edit_service_path(@service)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch service_path(@service), params: { service: { name: @service.name,
                                                       image: @service.image } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_service_path(@service)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch service_path(@service), params: { service: { name: @service.name,
                                                       image: @service.image } }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Service.count' do
      delete service_path(@service)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as wrong user" do
    log_in_as(@other_user)
    assert_no_difference 'Service.count' do
      delete service_path(@service)
    end
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect destroy for wrong service" do
    log_in_as(@other_user)
    service = services(:one)
    assert_no_difference 'Service.count' do
      delete service_path(service)
    end
    assert_redirected_to root_url
  end

end
