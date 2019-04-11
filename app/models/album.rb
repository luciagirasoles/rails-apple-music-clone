class Album < ApplicationRecord
  has_and_belongs_to_many :songs, join_table: 'associations'
  has_and_belongs_to_many :artists, join_table: 'associations'
end
