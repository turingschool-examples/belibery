class JorgeValidator < ActiveModel::Validator
  def validate(record)
    if record.name == "Jorge"
      record.errors[:base] << "System Error. Jorge is too Belieber."
    end
  end
end

class Fan < ActiveRecord::Base
  validates :name,
            presence:  true,
            exclusion: { in: ["Justin Bieber"] },
            format:    { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

  validates :email,
            presence:     true,
            uniqueness:   true,
            confirmation: true,
            length:       { in: 5..50 }


  validates_with JorgeValidator

  belongs_to :location

  has_many :donations

  def beliebe
    "#{name} Belieber"
  end
end
