class Fan < ActiveRecord::Base
  belongs_to :location

  validates :name, presence: true,
                   format: { with: /\A[a-zA-Z]+\z/, message: "Name must be only letters."}
  validates :email, uniqueness: true, presence: true

  scope :by_location, ->(location_id) {
    where(location_id: location_id)
  }

  def nickname
    "#{name}lieber"
  end
end
