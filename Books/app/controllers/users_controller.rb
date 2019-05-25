class UsersController < ApplicationController

	 before_action :authenticate_user!,except: [:top]

    def edit

      @user = User.find(params[:id])

      if current_user.id != @user.id

        redirect_to current_user

      end

    end

    def top

    end

  def index

    @users = User.all

    @user = current_user

    @book = Book.new

  end

  def new

    @user = User.new


  end

  def show

    @user = User.find(params[:id])

    @books = @user.books.all

    @book = Book.new

  end

  def update

    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:update] = "User was successfully updated."
      redirect_to user_path(current_user)

  else

    render "edit"

  end


  end

  def user_params

  params.require(:user).permit(:name, :introduction, :profile_image)

end

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
