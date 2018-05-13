class Usuario < ApplicationRecord
  has_many :articulos, dependent: :destroy
  before_save { self.email = email.downcase }
  validates :usuario, presence: true,
            uniqueness: { case_sensitive: false },
            length: {minimum: 5, maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w\-.]+@[a-z\d\-.]+\.[a-z]+\z/i    
  validates :email, presence: true, 
            uniqueness: { case_sensitive: false },
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end