class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :post_comments, class_name: 'PostComment', dependent: :destroy
end
