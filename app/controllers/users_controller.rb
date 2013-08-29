class UsersController < ApplicationController
  def new
    @user = User.new
    @error = params[:error] if params[:error]
    @invited_params = params if params[:invite_id]
  end

  def create
    user = User.new(params[:user])
    if user.save
      set_current_user(user)
      Invite.set_campaign_to_user(params[:invited], user) if params[:invited]
      redirect_to user_path(user, :notice => "Welcome to Groupfundr #{user.first_name}!")
    else
      has_invite_conditional(params[:invited], "There was an error signing up")
    end
  end

  def show
    @user = User.find(params[:id])
    @notice = params[:notice] if params[:notice]
  end

  protected
  def has_invite_conditional(invite_params, message)
    if invite_params
      redirect_to new_user_path(:error => "There was an error signing up", :invite_id => invite_params[:invite_id], :token => invite_params[:token])
    else
      redirect_to new_user_path(:error => message)
    end
  end
end
