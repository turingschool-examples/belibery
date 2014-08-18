class Location < ActiveRecord::Base
  validates :city,    presence: true
  validates :state,   presence: true
  validates :country, presence: true

  has_many :fans

  def beliebe
    "#{city}lieber"
  end
end
