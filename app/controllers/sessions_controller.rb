class SessionsController < ApplicationController
  def new
    @user = User.new
    @error = params[:error] if params[:error]
  end

  def create
    if user = User.find_by_email(params[:user][:email])
      if user.authenticate(params[:user][:password])
        set_current_user(user)
        redirect_to user_path(user)
      else
        redirect_to sign_in_path(:error => 'Incorrect Password')
      end
    else
      redirect_to sign_in_path(:error => 'Incorrect Email')
    end
  end

  def destroy
    remove_current_user
    redirect_to root_path
  end
end
