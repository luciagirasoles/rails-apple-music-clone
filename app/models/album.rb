# == Schema Information
#
# Table name: albums
#
#  id         :bigint(8)        not null, primary key
#  rating     :integer          default(0)
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#
# Indexes
#
#  index_albums_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Album < ApplicationRecord
  has_and_belongs_to_many :songs, join_table: 'associations'
  has_and_belongs_to_many :artists, join_table: 'associations'
  belongs_to :user
  
  validates :title, presence: true
  validates :rating, presence: false

  accepts_nested_attributes_for :songs
  accepts_nested_attributes_for :artists

  has_one_attached :cover
  def self.search(search_title)
    self.where("title LIKE ?", "%#{search_title}%")
  end
  
end
