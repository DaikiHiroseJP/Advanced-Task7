class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update]
  before_action :set_user, only: [:followings, :followers]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
    is_matching_login_user
    @user = User.find(params[:id])
  end

  def update
    is_matching_login_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] ="You have updated user successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def followings
    @users = @user.followings
  end

  def followers
    @users = @user.followers
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def is_matching_login_user
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to current_user
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
end
