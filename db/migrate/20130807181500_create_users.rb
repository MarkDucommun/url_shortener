class CreateUsers < ActiveRecord::Migration
  def change
    eval(UserStuff.create_table)
  end
end
