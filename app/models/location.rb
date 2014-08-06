class Location < ActiveRecord::Base
  validates :city,    presence: true
  validates :state,   presence: true
  validates :country, presence: true, uniqueness: true

  def beliebe
    "#{city}lieber"
  end
end
