class User < ActiveRecord::Base
  # Remember to create a migration!
  validate :email, presence: true, uniqueness: true, email: true
  validate :name, presence: true
  validate :password_hash, presence: true

  has_many :url_to_users
  has_many :urls, through: :url_to_users

  def self.authenticate(email, a_password)
    @user = self.find_by_email(email)
    puts @user.password
    @user if @user.password == a_password
  end

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end
end
