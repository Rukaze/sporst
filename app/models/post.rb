class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true ,uniqueness: true
  validates :league,presence: true , uniqueness: true
end
