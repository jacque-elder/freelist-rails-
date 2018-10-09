require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  def setup
    @user = users(:archer)
    @service = services(:one)
    @review = @service.reviews.build(rating: "5", comment: "Lorem ipsum", user_id: @user.id)
  end

  test "should be valid" do
    assert @review.valid?
  end

  test "user id should be present" do
    @review.user_id = nil
    assert_not @review.valid?
  end

  test "service id should be present" do
    @review.service_id = nil
    assert_not @review.valid?
  end

  test "rating should be present" do
    @review.rating = nil
    assert_not @review.valid?
  end
end
