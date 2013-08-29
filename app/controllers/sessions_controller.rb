class SessionsController < ApplicationController
  def new
    @user = User.new
    @error = params[:error] if params[:error]
    @invited_params = params if params[:invite_id]
  end

  def create
    if user = User.find_by_email(params[:user][:email])
      user_authenitcated_contitional(user, params)
    else
      has_invite_conditional(params[:invited], "Incorrect Email")
    end
  end

  def destroy
    remove_current_user
    redirect_to root_path
  end

  protected
  def has_invite_conditional(invite_params, message)
    if invite_params
      redirect_to sign_in_path(:error => message, :invite_id => invite_params[:invite_id], :token => invite_params[:token])
    else
      redirect_to sign_in_path(:error => message)
    end
  end

  def user_authenitcated_contitional(user, params)
    if user.authenticate(params[:user][:password])
      set_current_user(user)
      Invite.set_campaign_to_user(params[:invited], user) if params[:invited]
      redirect_to user_path(user)
    else
      has_invite_conditional(params[:invited], "Incorrect Password")
    end
  end
end
