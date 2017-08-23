class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_create :send_welcome_email

  devise         :database_authenticatable, :registerable,
                 :recoverable, :rememberable, :trackable, :validatable
  has_many       :bookings
  has_many       :projects

  has_attachments :photos, maximum: 10 #limiting upload to 10 units
  has_attachments :videos, maximum: 10 #limiting upload to 10 units
  has_attachments :voices, maximum: 10 #limiting upload to 10 units


  validates :first_name, presence: :true, on: :update, unless: :devise?
  validates :last_name, presence: :true, on: :update, unless: :devise?
  validates :zip_code, presence: :true, on: :update, unless: :devise?
  validates :address, presence: :true, on: :update, unless: :devise?
  validates :city, presence: :true, on: :update, unless: :devise?
  validates :phone_number, presence: :true, on: :update, unless: :devise?
  validates :gender, presence: :true, on: :update, unless: :devise?
  validates :birthday, presence: :true, on: :update, unless: :devise?
   with_options if: :actor? do |actor|
    actor.validates_inclusion_of :avaibility, :in => [true, false], on: :update
    actor.validates :voice_attribute, presence: :true, on: :update
    actor.validates :voice_attribute, presence: :true, on: :update, unless: :devise?
  end

  enum voice_attribute: [:Baryton, :Ténor, :Soprano, :Mezzo]
  enum gender: [:Femme, :Homme]
  enum role: [:DA, :actor]

  private

  def devise?
    email_changed? || encrypted_password_changed?
  end

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
end
