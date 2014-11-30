require 'rails_helper'

RSpec.describe Location, :type => :model do
  def valid_attributes
    {
      city:    "Denver",
      state:   "Colorado",
      country: "United States"
    }
  end

  it "it creates a location" do
    result = Location.new(valid_attributes)

    expect(result).to be_valid
    expect(result.city).to eq("Denver")
    expect(result.state).to eq("Colorado")
    expect(result.country).to eq("United States")
  end

  it "it cannot create a location without an city" do
    result = Location.new(
      state:   "Colorado",
      country: "United States"
      )

    expect(result).to be_invalid
  end

  it "it cannot create a location without an state" do
    result = Location.new(
      city:    "Denver",
      country: "United States"
      )

    expect(result).to be_invalid
  end

  it "it cannot create a location without an country" do
    result = Location.new(
      city:    "Denver",
      state:   "Colorado"
      )

    expect(result).to be_invalid
  end

  it "it can beliebe a location" do
    result = Location.create(valid_attributes)
    expect(result.beliebe).to eq("Denverlieber")
  end

  it "has have many fans" do
    location = Location.create(valid_attributes)
    fan      = Fan.create(name: "Gustavo", email: "belieber@example.com")
    location.fans << fan

    expect(location.fans.count).to eq(1)
    expect(location.fans).to include(fan)
  end
end
