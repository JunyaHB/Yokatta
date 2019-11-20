class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, foreign_key: "comment_id", dependent: :destroy
  has_many :advices, dependent: :destroy

  validates :content, {presence: true, length: {maximum: 150}}  
end
