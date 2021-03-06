class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find(params['user'][:id])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path, notice: "Bad login"
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
