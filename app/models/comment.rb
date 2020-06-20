class Comment < ApplicationRecord
  ##校验
  validates :comment, presence: true


  ##关联
  belongs_to :user
  belongs_to :post, dependent: :destroy
end
