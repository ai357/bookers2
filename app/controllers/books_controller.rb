class BooksController < ApplicationController

  def new
    @book = Book.new
  end


  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end


  def index
    @book = Book.new
    @books = Book.all
    @user = current_user

  end


  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end


  def edit
    @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
     redirect_to books_path
    end
  end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  def update
    @book = Book.find(params[:id])
    @book.update(books_params)
    if @book.save
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render :edit
    end
  end





  private

  def books_params
    params.require(:book).permit(:title, :body)
  end


end


