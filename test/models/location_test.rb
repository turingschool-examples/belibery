require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  def valid_attributes
    {
      city:    "Denver",
      state:   "Colorado",
      country: "United States"
    }
  end

  test "it creates a location" do
    result = Location.new(valid_attributes)

    assert result.valid?
    assert_equal "Denver",        result.city
    assert_equal "Colorado",      result.state
    assert_equal "United States", result.country
  end

  test "it cannot create a location without an city" do
    result = Location.new(
      state:   "Colorado",
      country: "United States"
      )

    assert result.invalid?
  end

  test "it cannot create a location without an state" do
    result = Location.new(
      city:    "Denver",
      country: "United States"
      )

    assert result.invalid?
  end

  test "it cannot create a location without an country" do
    result = Location.new(
      city:    "Denver",
      state:   "Colorado"
      )

    assert result.invalid?
  end

  test "it can beliebe a location" do
    result = Location.create(valid_attributes)

    assert_equal "Denverlieber", result.beliebe
  end

  test "locations have many fans" do
    location = Location.create(valid_attributes)
    fan      = Fan.create(name: "Gustavo", email: "belieber@example.com")
    location.fans << fan

    refute          location.fans.empty?
    assert_equal    1, location.fans.count
    assert_includes location.fans, fan
  end
end
