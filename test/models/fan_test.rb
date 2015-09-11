require 'test_helper'

class FanTest < ActiveSupport::TestCase
  should belong_to(:location)

  def valid_attributes
    {
      name: "Jorge",
      email: "yosoybelieber@example.com"
    }
  end

  test "it creates a fan" do
    fan = Fan.new(valid_attributes)
    assert fan.valid?
    assert_equal "Jorge", fan.name
    assert_equal "yosoybelieber@example.com", fan.email
  end

  test "it cannot create a fan without a name" do
    fan = Fan.new(email: "yosoybelieber@example.com")

    assert fan.invalid?, "Fan is valid but doesn't have a name and it should not be valid."
  end

  test "the email must be unique" do
    2.times { Fan.create(valid_attributes) }

    fans = Fan.where(email: "yosoybelieber@example.com")

    assert_equal 1, fans.count
  end

  test "the name is only lower and uppercase letters" do
    fan = Fan.new(name: "Jorg3", email: "yosoybelieber@example.com")

    assert fan.invalid?
  end

  test "it has a nickname" do
    fan = Fan.new(valid_attributes)

    assert_equal "Jorgelieber", fan.nickname
  end

  test "it returns only fans in a specific location" do
    Fan.delete_all

    jorge = Fan.create(name: "Jorge",    email: "belieber1@example.com", location_id: 1)
    Fan.create(name: "Clarence", email: "belieber2@example.com", location_id: 1)
    Fan.create(name: "Jeff",     email: "belieber3@example.com", location_id: 1)

    justin = Fan.create(name: "Justin",     email: "belieber4@example.com", location_id: 2)

    assert_equal 3, Fan.by_location(1).count
    assert Fan.by_location(1).include?(jorge)
    refute Fan.by_location(1).include?(justin)
  end
end
