class RmNameEmailIndexUsers < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, :email
    remove_index :users, :name
  end
end
