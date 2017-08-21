class UsersController < ApplicationController
  def index
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to "/"
    else
      render :edit
    end
  end


  def user_params
      params.require(:user).permit(:first_name, :last_name, :photos)
  end

end
