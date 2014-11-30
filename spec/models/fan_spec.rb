require 'rails_helper'

RSpec.describe Fan, :type => :model do
  def valid_attributes
    {
      name:               "Gustavo",
      email:              "yosoybelieber@example.com",
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
end
