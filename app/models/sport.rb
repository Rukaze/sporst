class Sport < ApplicationRecord
  validates :league,presence: true , uniqueness: true
end
