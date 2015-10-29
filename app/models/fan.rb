class Fan < ActiveRecord::Base
  validates :name, presence: true,
                   format: { with: /\A[a-zA-Z ]+\z/, 
                             message: "can only contain letters"}

  validates :email, presence: true, 
                    uniqueness: true,
                    length: { in: 5..50 }

  validate :no_tories
  belongs_to :location
  
  def nickname
    "#{name}lieber"
  end

  def no_tories
    errors.add(:name, "cannot be torie") if name == "torie" || name == "Torie"
  end
end
