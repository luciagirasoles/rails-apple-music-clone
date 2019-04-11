class Song < ApplicationRecord
  has_and_belongs_to_many :albums, join_table: 'associations'
  has_and_belongs_to_many :artists, join_table: 'associations'
end
