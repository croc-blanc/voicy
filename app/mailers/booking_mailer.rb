class BookingMailer < ApplicationMailer

  def bookingproject(booking)
    @user = booking.user
    @project = booking.project  # Instance variable => available in view

    mail(to: @user.email, subject: 'Congrats, vous avez été booké sur un projet!')
    # This will render a view in `app/views/user_mailer`!
  end
end

