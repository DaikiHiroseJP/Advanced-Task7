class BooksController < ApplicationController
  before_action :ensure_user, only: [:edit, :update, :destroy]

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    @user = User.find_by(id: @book.user_id)
    @book_comment = BookComment.new
  end

  def index
    @book = Book.new
    @books = Book.includes(:favorite)
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
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

  def ensure_user
    @books = current_user.books
    @book = @books.find_by(id: params[:id])
    redirect_to books_path unless @book
  end
end
