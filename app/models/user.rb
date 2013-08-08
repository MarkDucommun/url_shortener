class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :favorites
  has_many :urls, through: :favorites

  eval(UserHelper.add_methods_to_model)
end
