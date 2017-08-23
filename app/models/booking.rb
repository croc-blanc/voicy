class Booking < ApplicationRecord

  after_create :send_booking_email

  belongs_to :project
  belongs_to :user
  validates :user_id, uniqueness: { scope: :project }

private

  def send_booking_email
    BookingMailer.bookingproject(self).deliver_now
  end
end
