class Fan < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, 
                    uniqueness: true

  # validates_presence_of :name
end
