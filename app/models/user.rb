class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :guest_reviews, class_name:"GuestReview",foreign_key:"guest_id"
  has_many :host_reviews, class_name:"HostReview",foreign_key:"host_id"
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable
  validates :fullname, presence: true

  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first
      if user
        return user
      else
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.email = auth.info.email
          user.password = Devise.friendly_token[0, 20]
          user.fullname = auth.info.name  
          user.image = auth.info.image 
          user.uid = auth.uid
          user.provider = auth.provider

          user.skip_confirmation!
      end
    end
  end
end
