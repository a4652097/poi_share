class UsersController < ApplicationController
  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update(user_params)
      redirect_to edit_user_path(params[:id])
    end
  end

  private
    def user_params
      params.require(:user).permit(:nickname, :signature, :city, :avatar)
    end
end
