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
  
  #Codigo de recuperacion de contraseña
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    self.save!
    UserMailer.forgot_password(self).deliver # This sends an e-mail with a link for the user to reset the password
  end
  
# This generates a random password reset token for the user
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Usuario.exists?(column => self[column])
  end
  
end