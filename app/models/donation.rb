class Donation < ActiveRecord::Base
  validates :amount, numericality: { greater_than: 0 }
  validates :fan, presence: true
  validate  :cheapness

  belongs_to :fan

  def cheapness
    errors.add(:amount, "You are not fancy.") if amount == 1
  end
end
