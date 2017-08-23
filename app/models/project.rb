class Project < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_many :users, through: :bookings
  enum category: [ :film, :série, :animation, :publicité ]
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :name, presence: true, length: { minimum: 2 }
  validates :address, presence: true, length: { minimum: 6 }
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
