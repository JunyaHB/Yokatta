class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_secure_password
  has_many :posts

  mount_uploader :image_name, ImageNameUploader
  validates :name, {presence: true, uniqueness: true, length: {maximum: 10}}  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true}  

end