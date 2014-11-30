require 'rails_helper'

RSpec.describe Fan, :type => :model do
  def valid_attributes
    {
      name:               "Gustavo",
      email:              "yosoybelieber@example.com",
      email_confirmation: "yosoybelieber@example.com"
    }
  end

  it "it creates a fan" do
    result = Fan.new(valid_attributes)
    expect(result).to be_valid
    expect(result.name).to eq("Gustavo")
    expect(result.email).to eq("yosoybelieber@example.com")
  end

  it "it cannot create a fan without an name" do
    result = Fan.new(email: "yosoybelieber@example.com")
    expect(result).to be_invalid
  end

  it "it cannot create a fan without an email" do
    result = Fan.new(name: "Gustavo")
    expect(result).to be_invalid
  end

  it "it cannot create a fan with the same email" do
    2.times { Fan.create(valid_attributes) }

    result = Fan.where(email: "yosoybelieber@example.com")
    expect(result.count).to eq(1)
  end

  it "it can beliebe" do
    result = Fan.create(valid_attributes)
    expect(result.beliebe).to eq("Gustavo Belieber")
  end

  it "it belongs to a location" do
    location = Location.create(
      city:    "Denver",
      state:   "Colorado",
      country: "United States"
      )

    attributes = valid_attributes.merge(location_id: location.id)
    result     = Fan.create(attributes)

    expect(result.location).to eq(location)
  end

  it "it has many donations" do
    fan      = Fan.create(valid_attributes)
    donation = fan.donations.create

    expect(fan.donations).to include(donation)
  end

  it "it doesn't create a fan named Justin Bieber" do
    fan = Fan.create(
      name:               "Justin Bieber",
      email:              "justin@example.com",
      email_confirmation: "justin@example.com"
      )

    expect(fan).to be_invalid
  end

  it "it only accepts letters as a name" do
    fan = Fan.create(
      name:               "1234567890",
      email:              "justin@example.com",
      email_confirmation: "justin@example.com"
      )

    expect(fan).to be_invalid
  end

  it "it only accepts an email between 5 to 50 characters" do
    fan = Fan.create(
      name:               "Gustavo",
      email:              "jus",
      email_confirmation: "jus"
      )

    expect(fan).to be_invalid
  end

  it "it cannot create a fan named Jorge" do
    fan = Fan.create(
      name:               "Jorge",
      email:              "justin@example.com",
      email_confirmation: "justin@example.com"
      )

    expect(fan).to be_invalid
    error_messages = fan.errors.messages[:base]
    expect(error_messages).to include("System Error. Jorge is too Belieber.")
  end
end
