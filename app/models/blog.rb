class Blog < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :favorites, dependent: :destroy
  has_many :blog_comments, dependent: :destroy
  
  attachment :image
end
