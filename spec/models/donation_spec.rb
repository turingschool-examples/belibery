require 'rails_helper'

RSpec.describe Donation, :type => :model do
  it "accepts only numbers in amount greater than zero" do
    fan      = Fan.new
    fan.save(validate: false)
    donation = fan.donations.create(amount: -100)

    expect(donation).to be_invalid
  end

  it "can only be creates if a user exists" do
    donation = Donation.create(amount: 100)
    expect(donation).to be_invalid
  end

  it "doesn't create a donation of one dollar" do
    fan      = Fan.new
    fan.save(validate: false)
    donation = fan.donations.create(amount: 1)

    expect(donation).to be_invalid
    error_messages = donation.errors.messages[:amount]
    expect(error_messages).to include("You are not fancy.")
  end
end
