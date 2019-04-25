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