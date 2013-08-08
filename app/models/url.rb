require 'open-uri'

class Url < ActiveRecord::Base
  # Remember to create a migration!
  validates :long_url, presence: true, url: true, uniqueness: true
  validates :short_url, presence: true, uniqueness: true
  #validates :title, presence: true

  before_validation :shorten_url#, :get_title

  has_many :favorites
  has_many :users, through: :favorites

  def shorten_url
    self.short_url ||= SecureRandom.urlsafe_base64(5)
  end

  # def get_title
  #   self.title ||= Nokogiri::HTML(open(long_url)).title
  # end

  def increment_click_count
    self.click_count = click_count + 1
    self.save
  end
end
