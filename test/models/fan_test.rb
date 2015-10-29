require 'test_helper'

class FanTest < ActiveSupport::TestCase

  def valid_attributes
    {
      name: "Ross Edfort",
      email: "truebelieber@gmail.com",
      location_id: 1
    }
  end

  test "fan is created with valid attributes" do
    fan = Fan.new(valid_attributes)

    assert fan.valid?
    assert_equal "Ross Edfort", fan.name
    assert_equal "truebelieber@gmail.com", fan.email
  end

  test "fan is invalid when missing name" do
    fan = Fan.new(email: "somevalidemail@yahoo.com",
                  location_id: 1)

    refute fan.valid?
  end

  test "fan is invalid when missing email" do
    fan = Fan.new(name: "Justina Bieber",
                  location_id: 1)

    refute fan.valid? 
  end

  test "fan in invalid with duplicate email" do
    2.times { Fan.create(valid_attributes) }

    result = Fan.where(email: "truebelieber@gmail.com")

    assert_equal 1, result.count
  end

  test "fan name only contains letters" do
    fan = Fan.new(name: "Ro55 Edfort",
                  email: "truebelieber@gmail.com",
                  location_id: 1)

    refute fan.valid?
  end

  test "fan email must be between 5 and 50 characters" do
    long_email_fan = Fan.new(name: "Ross Edfort",
                             email: "abcdeabcdeababcdeabcdeababcdeabcdeababcdeabcdeabcdeabcdeabcde@yahoo.com",
                             location_id: 1)
    short_email_fan = Fan.new(name: "Ross Edfort",
                              email: "abcd",
                              location_id: 1)

    refute long_email_fan.valid?
    refute short_email_fan.valid?
  end

  test "fan cannot be named torie" do
    fan = Fan.new(name: "Torie",
                  email: "truebelieber@gmail.com",
                  location_id: 1)

    refute fan.valid?
  end

  test "fan has a belieber nickname" do
    fan = Fan.new(valid_attributes)

    assert_equal "Ross Edfortlieber", fan.nickname
  end

  should belong_to(:location)
end
