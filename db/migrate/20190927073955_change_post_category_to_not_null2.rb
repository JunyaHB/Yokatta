class ChangePostCategoryToNotNull2 < ActiveRecord::Migration[5.2]
  def change
    change_column_null :posts, :category, null: true
  end
end

