class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user
      redirect_to post_image_path
    end
    
    @user = User.find(params[:id])
  end
  
  def update
    user = user.find(params[:id])
    unless user == current_user.id
      redirect_to post_image_path
    end
    
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end
