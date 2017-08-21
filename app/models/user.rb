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

  validates :first_name, presence: :true, on: :update
  validates :last_name, presence: :true, on: :update
  validates :zip_code, presence: :true, on: :update
  validates :address, presence: :true, on: :update
  validates :city, presence: :true, on: :update
  validates :phone_number, presence: :true, on: :update
  validates :gender, presence: :true, on: :update
  validates :birthday, presence: :true, on: :update
  validates :role, numericality: true
  with_options if: :actor? do |actor|
    actor.validates_inclusion_of :avaibility, :in => [true, false], on: :update
    actor.validates :voice_attribute, presence: :true, on: :update
  end


  enum voice_attribute: [:grave, :moyen, :aigu]
  enum gender: [:femme, :homme]
  enum role: [:DA, :actor]

 # def is_actor?
 #   current_user.actor?
 # end
end
