class Project < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_many :users, through: :bookings
  enum type: [ :film, :serie, :dessin_anime, :publicite ]
end
