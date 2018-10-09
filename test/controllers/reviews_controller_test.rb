require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @review = reviews(:one)
    @service = services(:one)
    @service.id = services(:one).id
    @user = users(:michael)
  end

  test "should redirect new when not logged in" do
    get new_service_review_path(@service)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when not logged in" do
    get edit_service_review_path(@service, @review)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch service_review_path(@service, @review), params: { review: { 
    														comment: "Lorem ipsum",
                                                            rating: "5" } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Review.count' do
      delete service_review_path(@service, @review)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong review" do
    log_in_as(users(:michael))
    review = reviews(:one)
    assert_no_difference 'Review.count' do
      delete service_review_path(@service, @review)
    end
    assert_redirected_to root_url
  end
end
