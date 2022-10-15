class BooksController < ApplicationController

  def new
    @book = Book.new
  end


  def create
    @book = Book.new()
    @book.user_id = current_user.id
    @book.save

  end


  def index
    
  end


  def show
  end


  def destroy
  end




  private

  def


end
