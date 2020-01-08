class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         
  devise :omniauthable, omniauth_providers: [:google_oauth2, :facebook]

  has_many :feeds, dependent: :destroy
  acts_as_commontator
  acts_as_followable
  acts_as_follower
  acts_as_voter
  has_one_attached :avatar

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name   # assuming the user model has a name
      user.provider = "facebook"
    end
  end

  def self.from_omniauth(access_token)
    where(provider: access_token.provider, uid: access_token.uid).first_or_create do |user|
      user.email = access_token.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = access_token.info.name   # assuming the user model has a name
      user.provider = "google"
    end
  end
end
