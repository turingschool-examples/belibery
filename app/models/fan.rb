class Fan < ActiveRecord::Base
  validates :name,  presence: true
  validates :email, presence: true, uniqueness: true

  def beliebe
    "#{name} Belieber"
  end
end
