class AddRelationships < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :url_id, index: true
      t.integer :user_id, null: true, index: true
    end
  end
end
