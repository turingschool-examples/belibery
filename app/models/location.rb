class Location < ActiveRecord::Base
  validates :city,    presence: true
  validates :state,   presence: true
  validates :country, presence: true

  has_many :fans

  scope :by_city, -> { order("city asc") }

  default_scope { where("country IS NOT ?", "X") }

  def beliebe
    "#{city}lieber"
  end
end
