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

require 'rails_helper'

RSpec.describe Rating, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
