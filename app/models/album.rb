class Album < ApplicationRecord
  has_many :associations  
  has_many :songs, through: :associations
  has_many :artists, through: :associations 
end
