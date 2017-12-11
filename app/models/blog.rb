class Blog < ApplicationRecord
  belongs_to :user
  has_many :post
  has_many :comment
end
