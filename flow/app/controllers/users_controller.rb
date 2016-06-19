class UsersController < ApplicationController

  def login

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    p user_params
    p "*"*100
    p @user
    if @user.save
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      @user.errors.full_messages
      flash[:failure] = "It didn't work!"
      render new_user_path
    end

  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
