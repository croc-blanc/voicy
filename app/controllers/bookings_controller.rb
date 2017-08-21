class BookingsController < ApplicationController
  def destroy
    # A voir le Booking.find(params[:format].to_i) il ne me s'emble pas propre
    # l'url de suppression est bookings/destroy.17 au lieu de bookings/destroy/17
    booking = Booking.find(params[:format].to_i)
    booking.destroy
    redirect_to project_path(booking.project_id)
  end
end
