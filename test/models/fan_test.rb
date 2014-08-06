require 'test_helper'

class FanTest < ActiveSupport::TestCase
  def valid_attributes
    {
      name: "Gustavo",
      email: "yosoybelieber@example.com"
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
end
