class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise         :database_authenticatable, :registerable,
                 :recoverable, :rememberable, :trackable, :validatable
  has_many       :bookings
  has_many       :projects
  has_attachments :photos, maximum: 10 #limiting upload to 10 units
  has_attachments :videos, maximum: 10 #limiting upload to 10 units
  has_attachments :voices, maximum: 10 #limiting upload to 10 units

  enum voice_attribute: [:grave, :moyen, :aigu]
  enum gender: [:femme, :homme]
  enum avaibility: [:oui, :non]
end
