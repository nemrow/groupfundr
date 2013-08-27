require 'spec_helper'

describe UserJoinedCampaign do

  context "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:campaign) }
  end
end
