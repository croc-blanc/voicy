class BookingsController < ApplicationController
  def new
    @projects = current_user.projects
    booking = Booking.new
  end
  def create
    booking = Booking.new(booking_params)
    if booking.save
      redirect_to users_path
      flash[:notice] = "L'acteur à bien était ajouté à votre projet !"
    else
      redirect_to users_path
      flash[:alert] = "Cet acteur est déjà présent dans votre projet" 
    end
  end

  def destroy
    # A voir le Booking.find(params[:format].to_i) il ne me s'emble pas propre
    # l'url de suppression est bookings/destroy.17 au lieu de bookings/destroy/17
    booking = Booking.find(params[:id])
    booking.destroy
    redirect_to project_path(booking.project_id)
  end

  private

  def booking_params
      params.require(:booking).permit(:project_id, :user_id)
  end
end
