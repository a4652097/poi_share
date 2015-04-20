class UsersController < ApplicationController
  before_action :get_user_id, only:[:edit, :update]
  def edit;  end

  def update
    if @user.update(user_params)
      redirect_to edit_user_path(params[:id])
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:nickname, :signature, :city, :avatar)
    end

    def get_user_id
      @user = User.find_by_id(params[:id])
    end
end
