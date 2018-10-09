require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @service = @user.services.build(description: "Lorem ipsum", image: "www.example.com/imageurl", name: "Example Service", price: "$10.00", user_id: @user.id)
  end

  test "should be valid" do
    assert @service.valid?
  end

  test "user id should be present" do
    @service.user_id = nil
    assert_not @service.valid?
  end

  test "description should be present" do
    @service.description = "   "
    assert_not @service.valid?
  end

  test "order should be most recent first" do
    assert_equal services(:most_recent), Service.first
  end

  test "associated reviews should be destroyed" do
    @service.save
    @service.reviews.create!(rating: "5", comment: "Lorem ipsum", user_id: @user.id)
    assert_difference 'Review.count', -1 do
      @service.destroy
    end
  end
end