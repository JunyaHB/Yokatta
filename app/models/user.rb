class User < ApplicationRecord
  has_secure_password
  has_many :posts

  mount_uploader :image_name, ImageNameUploader
  validates :name, {presence: true, uniqueness: true, length: {maximum: 10}}  
  validates :email, {presence: true, uniqueness: true}  

end