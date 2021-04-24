class BooksController < ApplicationController
  def new
  end

  def create
        # １. データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to books_path
    else
    render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user.id
  end

  def show
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
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
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

    private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
