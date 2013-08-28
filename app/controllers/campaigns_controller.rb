class CampaignsController < ApplicationController
  def new
    @campaign = Campaign.new
  end

  def create
    campaign = Campaign.new(params[:campaign])
    if campaign.save
      current_user.owned_campaigns << campaign
      redirect_to campaign_path(campaign, :notice => "You have successfully started the \"#{campaign.name}\" Campaign")
    else
      redirect_to new_campaign_path(:error => 'could not create campaign')
    end
  end

  def show
    if @campaign = Campaign.find(params[:id])
      @notice = params[:notice] if params[:notice]
    else
      redirect_to root_path(:error => "We could not find that campaign")
    end
  end
end
