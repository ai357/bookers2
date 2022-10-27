class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @books = @user.books
  end


  def index
    @user = current_user
    @users = User.all

  end


  def edit
    @user = User.find(params[:id])
    @user = current_user
  end


  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end


  private

  def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
