class User < ApplicationRecord
    before_save { self.email = email.downcase }
    has_secure_password validations: false
    has_many :posts
  
    mount_uploader :image_name, ImageNameUploader
    validates :name, {presence: true, uniqueness: true, length: {maximum: 10}}  
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true}  
  
    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = auth.info.email
        user.image_name = auth.info.image
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        return user
     end
   end  
end
  