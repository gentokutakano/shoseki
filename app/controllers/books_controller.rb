class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @books = Book.all.order(id: "DESC")
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to book_path(@book), notice: "書籍を投稿しました。"
    else
      render :new
    end
  end
  
  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
        redirect_to books_path, alert: "不正なアクセスです。"
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "書籍を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to user_path(book.user), notice: "書籍を削除しました。"
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
