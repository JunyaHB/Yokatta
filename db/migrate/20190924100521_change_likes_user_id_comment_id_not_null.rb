class ChangeLikesUserIdCommentIdNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :likes, :user_id, false
    change_column_null :likes, :comment_id, false
  end
end


