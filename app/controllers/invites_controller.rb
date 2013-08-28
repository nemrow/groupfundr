class InvitesController < ApplicationController
  def create
    campaign = Campaign.find(params[:campaign_id])
    invite = Invite.new(params[:invite])
    if invite.save
      campaign.invites << invite
      redirect_to campaign_path(campaign, :notice => "Invite to #{invite.name} sent successfully")
    else
      redirect_to campaign_path(campaign, :error => "Could not send invite to #{invite.name}.")      
    end
  end
end
