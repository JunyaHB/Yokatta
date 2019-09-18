class RemoveUserIdFromPosts < ActiveRecord::Migration[5.2]
  def up
    remove_column :posts, :user_id
      end

  def down
    add_column :posts, :user_id, :integer
  end
end
