class BooksController < ApplicationController
  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
    else
    @books = Book.all
    @user_name = current_user.name
    @user_intro = current_user.introduction
    render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    # @user = current_user.id
    @user_name = current_user.name
    @user_intro = current_user.introduction
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book
    @user_name = current_user.name
    @books = Book.all
    books = @books
    @books_current = current_user.books
    @user_intro = current_user.introduction
  end

  def edit
    @book = Book.find(params[:id])
    # if @book.user == current_user
    #   redirect_to edit_book_path(current_user.id)
    # else
    #   render "index"
    # end
    @user = @book.user
    if @user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

    private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
