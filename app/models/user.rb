class User < ActiveRecord::Base
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    @user = User.find_by(email: email)
    if @user
      @user.authenticate(password)
    end
  end

  
  has_many :reviews
  has_many :orders
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }
end
