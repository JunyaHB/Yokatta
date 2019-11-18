class AddindextoLikes < ActiveRecord::Migration[5.2]
  def change
    add_index :likes, :user_id
    add_index :likes, :comment_id
    add_index :likes, [:user_id, :comment_id], unique: true
  end
end