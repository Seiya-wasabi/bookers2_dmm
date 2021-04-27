class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.new
    @user_i = current_user
    @user = current_user.id
    @user_name =  current_user.name
    @user_intro = current_user.introduction
  end

  def show
    @book_new = Book.new
    @user = User.find(params[:id])
    # @books = Book.find(current_user.id).all
    @books = Book.all
    books = @books
    @books_current = @user.books
    @user_intro = current_user.introduction
    @user_current = current_user.id
  end

  def edit
    @user = User.find(params[:id])
    # if @book.user == current_user
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "Welcome! You have signed up successfully."
    redirect_to user_path(@user.id)
    else
    render "edit"
    end
  end

  def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
