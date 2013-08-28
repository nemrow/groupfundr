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
      @error = params[:error] if params[:error]
      if current_user = @campaign.owner
        @user_role = 'owner'
        @invite = Invite.new
        @invited = @campaign.invites
        # render owner data
      elsif @campaign.participants.includes?(current_user)
        @user_role = 'participant'
        # render participant data
      else
        # redirect to public campaign site with permissions error
      end
    else
      redirect_to root_path(:error => "We could not find that campaign")
    end
  end

  def index
    @owned_campaigns = current_user.owned_campaigns
    @joined_campaigns = current_user.joined_campaigns
  end
end
