class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @booking = Booking.new
  end

  def update
    @user = current_user
    if current_user.DA?
      if @user.update(user_params_da)
        redirect_to user_path(current_user)
      else
        render :edit
      end
    else
      if @user.update(user_params)
        redirect_to user_path(current_user)
      else
        render :edit
      end
    end
  end


  def user_params
      params.require(:user).permit(
        :first_name, :last_name, :phone_number, :address, :city, :birthday,
        :website, :avaibility, :description, :zip_code, :gender, :voice_attribute,
        voices: [], videos: [], photos: []
      )
  end
  def user_params_da
      params.require(:user).permit(
        :first_name, :last_name, :phone_number, :address, :city, :birthday,
        :website, :description, :zip_code, :gender
        )
  end
end
