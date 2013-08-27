class UserJoinedCampaign < ActiveRecord::Base
  attr_accessible :campaign_id, :goal, :link, :raised, :user_id

  belongs_to :campaign
  belongs_to :user
end
