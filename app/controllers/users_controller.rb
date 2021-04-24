class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user.id
    @user_name =  current_user.name
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    # if @book.user == current_user
    if @user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "Welcome! You have signed up successfully."
    redirect_to user_path(@user.id)
    end
  end

  def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
