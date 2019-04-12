class Artist < ApplicationRecord
  has_and_belongs_to_many :songs, join_table: 'associations'
  has_and_belongs_to_many :albums, join_table: 'associations'

  validates :name, presence: true, length: {minimum: 1, maximum: 50}
  validates :age, presence: false
end
