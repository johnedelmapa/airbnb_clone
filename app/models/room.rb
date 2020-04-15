class Room < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :reservations, dependent: :destroy
  validates :home_type,presence: true
  validates :room_type,presence: true
  validates :accommodate,presence: true
  validates :bedroom,presence: true
  validates :bathroom,presence: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def cover_photo(size)
    if photos.length > 0
      photos.first.image.url(size)
    else
      'blank.jpg'
    end
  end
end
