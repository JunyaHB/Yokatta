class Like < ApplicationRecord
  has_many :posts, dependent: :destroy
end
