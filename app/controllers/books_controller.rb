class BooksController < ApplicationController
  def new
  end

  def create
        # １. データを新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    book.user_id = current_user.id
    book.save
    # ３. トップ画面へリダイレクト
    redirect_to books_path
  end

  def index
    @book = Book.new
    @books = Book.all
    # @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
  end

  def destroy
  end

    private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
