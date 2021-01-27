class Public::UsersController < ApplicationController
  
  def my_page
    @user = current_user
    @blogs = @user.blogs.page(params[:page]).reverse_order
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_my_page_path
    else
      render :edit
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction, :email, :image_id)
  end
end
