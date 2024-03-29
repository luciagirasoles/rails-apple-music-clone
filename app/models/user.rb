# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :string           default("user")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :role, inclusion: { in: %w(user admin)}

  devise :omniauthable, omniauth_providers: %i[facebook github]

  has_many :providers
  has_many :ratings  

  has_many :songs, join_table: 'associations'
  has_many :albums, join_table: 'associations'
  has_many :artists  


  after_create :welcome, :created

  def self.from_omniauth(auth)
    puts auth.to_json
    where(email: auth.info.email).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def admin? 
    self.role == "admin"
  end

  def welcome
    UserMailer.with(
      user: self
    ).user_welcome.deliver_later
  end

  def created
    User.where(role: "admin").each do |user|
      UserMailer.with(user: user) .user_created.deliver_later
    end
  end

end
