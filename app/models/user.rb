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
  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :zip_code, presence: :true
  validates :address, presence: :true
  validates :city, presence: :true
  validates :phone_number, presence: :true
  validates :gender, presence: :true
  validates :birthday, presence: :true
  validates :avaibility, presence: :true
  validates :voice_attribute, presence: :true
  validates :role, presence: true, numericality: true

  enum voice_attribute: [:grave, :moyen, :aigu]
  enum gender: [:femme, :homme]
  enum avaibility: [:oui, :non]
  enum role: [:DA, :actor]
end

