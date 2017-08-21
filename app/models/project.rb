class Project < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_many :users, through: :bookings
  enum category: [ :film, :serie, :dessin_anime, :publicite ]
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :name, presence: true, length: { minimum: 2 }

end
