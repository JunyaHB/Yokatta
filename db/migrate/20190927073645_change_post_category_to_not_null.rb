class ChangePostCategoryToNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :posts, :category, true
  end
end

