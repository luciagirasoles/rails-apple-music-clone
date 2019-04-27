# == Schema Information
#
# Table name: artists
#
#  id         :bigint(8)        not null, primary key
#  age        :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#
# Indexes
#
#  index_artists_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Artist < ApplicationRecord
  has_and_belongs_to_many :songs, join_table: 'associations', dependent: :delete_all
  has_and_belongs_to_many :albums, join_table: 'associations', dependent: :delete_all
  belongs_to :user
  
  validates :name, presence: true
  validates :age, presence: false

  has_one_attached :cover
  def self.search(search_name)
    self.where("name LIKE ?", "%#{search_name}%")
  end

end
