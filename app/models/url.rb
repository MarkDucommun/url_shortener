class Url < ActiveRecord::Base
  # Remember to create a migration!
  validates :long_url, presence: true, url: true, uniqueness: true
  validates :short_url, presence: true, uniqueness: true

  before_validation :shorten_url

  has_many :url_to_users
  has_many :users, through: :url_to_users

  def shorten_url
    self.short_url = SecureRandom.urlsafe_base64(5)
    # self.short_url = 7.times.map do
    #                   num = rand(1..3)
    #                   rand(0..9).to_s if num == 1
    #                   (97 + rand(0..25)).chr if num == 2
    #                   (65 + rand(0..25)).chr if num == 3
    # end.join
  end

  def increment_click_count
    self.click_count = click_count + 1
    self.save
  end
end
