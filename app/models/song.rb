class Song < ApplicationRecord
  has_many :associations
  has_many :artists, through: :associations
  has_many :albums, through: :associations 
end
