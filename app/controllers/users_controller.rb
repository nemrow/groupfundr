class UsersController < ApplicationController
  def new
    @user = User.new
    @error = params[:error] if params[:error]
  end

  def create
    user = User.new(params[:user])
    if user.save
      redirect_to user_path(user, :notice => "Welcome to Groupfundr #{user.first_name}!")
    else
      redirect_to new_user_path(:error => "There was an error signing up")
    end
  end

  def show
    @user = User.find(params[:id])
    @notice = params[:notice] if params[:notice]
  end
end
