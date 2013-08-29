class InvitesController < ApplicationController
  def create
    campaign = Campaign.find(params[:campaign_id])
    invite = Invite.new(params[:invite])
    if invite.save
      if Mailgun.send_invite(invite)
        campaign.invites << invite
        redirect_to campaign_path(campaign, :notice => "Invite to #{invite.name} sent successfully")
      else
        invite.destroy
        redirect_to campaign_path(campaign, :error => "Could not email that person. Another email?") 
      end
    else
      redirect_to campaign_path(campaign, :error => "Could not send invite to #{invite.name}.")      
    end
  end

  def show
    @invite = Invite.find(params[:id])
    if @invite.token == params[:token]
      @campaign = @invite.campaign
    else
      redirect_to root_path(:error => "Your token does not match this invitation!")
    end
  end

  def accept
    @invite = Invite.find(params[:invite_id])
    if @invite.token == params[:token]
      if current_user
        current_user.joined_campaigns << @invite.campaign
        @invite.update_attributes(:expired => true)
        redirect_to user_campaigns_path(current_user)
      end
    else

    end 
  end
end
