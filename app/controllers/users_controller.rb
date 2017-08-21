class UsersController < ApplicationController
  def index
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end


  def user_params
      params.require(:user).permit(:first_name, :last_name, :phone_number, :address, :city, :birthday, :website, :avaibility, :description, :zip_code,:gender,:voice_attribute, voices: [], videos: [], photos: [])
  end

end
