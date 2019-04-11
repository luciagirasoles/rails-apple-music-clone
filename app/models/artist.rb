class Artist < ApplicationRecord
  has_many :associations  
  has_many :songs, through: :associations
  has_many :albums, through: :associations 
end
