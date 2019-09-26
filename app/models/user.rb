class User < ApplicationRecord
  has_secure_password
  has_many :posts

  validates :name, {presence: true, length: {maximum: 10}}  
  validates :email, {presence: true}  

end