class BooksController < ApplicationController

   before_action :authenticate_user!,except: [:top]

	 before_action :current_user, only: [:edit, :destroy]

  def new

    @book = Book.new
  end

  def edit

    @book = Book.find(params[:id])

    if  current_user.id != @book.user.id

    redirect_to books_path

    end

  end

  def index

    @books = Book.all

    @users = User.all

    @user = current_user

    @book = Book.new

  end

  def update

    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:update] = "Book was successfully updated."
      #showの画面に遷移する
      redirect_to book_path(@book.id)
    else

      @bookq = Book.new

      render "edit"

    end

  end

  def destroy

    @book = Book.find(params[:id])
    @book.destroy
    flash[:destroy] = "Book was successfully destroyed."
    redirect_to books_path

  end

  def show

    @book = Book.find(params[:id])

    @bookq = Book.new

  end

  def create

    @book = Book.new(book_params)

    @book.user_id = current_user.id
    #DBへ保存
   if @book.save

    flash[:create] = "Book was successfully created."
    redirect_to book_path(@book.id)

  else

    @books = Book.all

    @user = current_user

    render "index"

  end

  end

   private

  def book_params

    params.require(:book).permit(:title, :body)

  end

end
