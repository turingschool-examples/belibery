require 'test_helper'

class DonationTest < ActiveSupport::TestCase
  test "it accepts only numbers in amount greater than zero" do
    fan      = Fan.new
    fan.save(validate: false)
    donation = fan.donations.create(amount: -100)

    assert donation.invalid?
  end

  test "it is only created if a user exists" do
    donation = Donation.create(amount: 100)

    assert donation.invalid?
  end

  test "it doesn't create a donation of one dollar" do
    fan      = Fan.new
    fan.save(validate: false)
    donation = fan.donations.create(amount: 1)

    assert donation.invalid?
    assert_includes donation.errors.messages[:amount],
                    "You are not fancy."
  end
end
