class Fan < ActiveRecord::Base
  validates :name,  presence: true
  validates :email, presence: true, uniqueness: true

  belongs_to :location

  def beliebe
    "#{name} Belieber"
  end
end
