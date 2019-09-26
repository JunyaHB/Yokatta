class Post < ApplicationRecord
#  belongs_to :user

  validates :content, {presence: true, length: {maximum: 84}}  
  validates :category, {presence: true}  

end
