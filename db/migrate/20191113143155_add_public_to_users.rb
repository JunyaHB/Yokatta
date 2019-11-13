class AddPublicToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :public, :boolean, default: false, null: false
  end

  def down
    remove :users, :public, :boolean, default: false, null: false
  end
end
