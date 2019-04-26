# == Schema Information
#
# Table name: providers
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  uid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#
# Indexes
#
#  index_providers_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Provider < ApplicationRecord
  belongs_to :user

  def self.from_omniauth(auth, user)
    where(name: auth.provider, uid: auth.uid).first_or_create do |provider|
      provider.name = auth.provider
      provider.uid = auth.uid
      provider.user_id = user.id
    end
  end
end
