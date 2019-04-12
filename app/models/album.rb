class Album < ApplicationRecord
  has_and_belongs_to_many :songs, join_table: 'associations'
  has_and_belongs_to_many :artists, join_table: 'associations'

  validates :title, presence: true, lenght: {minimum: 1, maximum: 50}
  validates :rating, presence: false
end
