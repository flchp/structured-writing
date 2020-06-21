class Category < ApplicationRecord


  ##校验
  validates :name, presence: true

  ##关联
  has_many :posts
  belongs_to :user
end
