class BooksController < ApplicationController
  def show

    @book = Book.find(params[:id])

  end

  def edit

    @book = Book.find(params[:id])

  end

  def destroy

    book = Book.find(params[:id])
    book.destroy
    flash[:destroy] = "Book was successfully destroyed."
    redirect_to books_path

  end

  def new

    @book = Book.new

  end

  def update

    @book = Book.find(params[:id])
    @book.update(book_params)
    flash[:update] = "Book was successfully updated."
    #showの画面に遷移する
    redirect_to book_path(@book.id)

  end

  def index

    @books = Book.all

    @book = Book.new

  end

  def create

    @book = Book.new(book_params)
    #DBへ保存
    @book.save

    flash[:create] = "Book was successfully created."

  end

  private

  def book_params

    params.require(:book).permit(:title, :body)

  end

end
