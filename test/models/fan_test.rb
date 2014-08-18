require 'test_helper'

class FanTest < ActiveSupport::TestCase
  def valid_attributes
    {
      name:               "Gustavo",
      email:              "yosoybelieber@example.com",
      email_confirmation: "yosoybelieber@example.com"
    }
  end

  test "it creates a fan" do
    result = Fan.new(valid_attributes)

    assert result.valid?
    assert_equal "Gustavo", result.name
    assert_equal "yosoybelieber@example.com", result.email
  end

  test "it cannot create a fan without an name" do
    result = Fan.new(email: "yosoybelieber@example.com")

    assert result.invalid?
  end

  test "it cannot create a fan without an email" do
    result = Fan.new(name: "Gustavo")

    assert result.invalid?
  end

  test "it cannot create a fan with the same email" do
    2.times { Fan.create(valid_attributes) }

    result = Fan.where(email: "yosoybelieber@example.com")
    assert_equal 1, result.count
  end

  test "it can beliebe" do
    result = Fan.create(valid_attributes)

    assert_equal "Gustavo Belieber", result.beliebe
  end

  test "it belongs to a location" do
    location = Location.create(
      city:    "Denver",
      state:   "Colorado",
      country: "United States"
      )

    attributes = valid_attributes.merge(location_id: location.id)
    result     = Fan.create(attributes)

    assert_equal location, result.location
  end

  test "it has many donations" do
    fan      = Fan.create(valid_attributes)
    donation = fan.donations.create

    assert fan.donations
    assert_includes fan.donations, donation
  end

  test "it doesn't create a fan named Justin Bieber" do
    fan = Fan.create(
      name:               "Justin Bieber",
      email:              "justin@example.com",
      email_confirmation: "justin@example.com"
      )

    assert fan.invalid?
  end

  test "it only accepts letters as a name" do
    fan = Fan.create(
      name:               "1234567890",
      email:              "justin@example.com",
      email_confirmation: "justin@example.com"
      )

    assert fan.invalid?
  end

  test "it only accepts an email between 5 to 50 characters" do
    fan = Fan.create(
      name:               "Gustavo",
      email:              "jus",
      email_confirmation: "jus"
      )

    assert fan.invalid?
  end

  test "it cannot create a fan named Jorge" do
    fan = Fan.create(
      name:               "Jorge",
      email:              "justin@example.com",
      email_confirmation: "justin@example.com"
      )

    assert fan.invalid?
    assert_includes fan.errors.messages[:base],
                    "System Error. Jorge is too Belieber."

  end
end
