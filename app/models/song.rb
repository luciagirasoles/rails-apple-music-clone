# == Schema Information
#
# Table name: songs
#
#  id         :bigint(8)        not null, primary key
#  duration   :integer
#  progress   :integer          default(0)
#  rating     :integer          default(0)
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#
# Indexes
#
#  index_songs_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Song < ApplicationRecord
  has_and_belongs_to_many :albums, join_table: 'associations', dependent: :delete_all
  has_and_belongs_to_many :artists, join_table: 'associations', dependent: :delete_all
  belongs_to :user

  validates :title, presence: true
  validates :duration, presence: false
  validates :rating, presence: false
  validates :progress, presence: false
  validate :progress_must_less_than_duration
  
  has_one_attached :cover
  has_many :ratings, as: :ratingable

  # Requirement: The progress could not be bigger than the duration.
  def progress_must_less_than_duration
    if (self.progress > self.duration)
      errors.add(:progress, "progress must less than duration")
    end
  end

end
