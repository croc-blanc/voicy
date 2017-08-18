class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise         :database_authenticatable, :registerable,
                 :recoverable, :rememberable, :trackable, :validatable
  has_many       :bookings
  has_many       :projects
  has_attachment :photos
  has_attachment :videos
  has_attachment :voices
end
