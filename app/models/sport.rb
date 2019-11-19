class Sport < ApplicationRecord
  validates :league, uniqueness: true, presence: true 
end
