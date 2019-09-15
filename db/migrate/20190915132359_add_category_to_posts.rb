class AddCategoryToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :category, :boolean, default: true, null: false
  end
end
