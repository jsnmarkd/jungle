class User < ApplicationRecord
  has_secure_password

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    new_email = email.downcase.strip
    user = User.where('lower(email) = ?', new_email).first

    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
