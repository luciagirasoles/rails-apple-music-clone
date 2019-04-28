# == Schema Information
#
# Table name: ratings
#
#  id              :bigint(8)        not null, primary key
#  ratingable_type :string
#  value           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  ratingable_id   :integer
#  user_id         :integer
#

class Rating < ApplicationRecord
  belongs_to :user 
  belongs_to :ratingable, :polymorphic => true
  
end
