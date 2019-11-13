class AddCommentBackimageToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :comment, :string
    add_column :users, :backimage, :string
  end

  def down
    remove :users, :comment, :string
    remove :users, :backimage, :string
  end
end
