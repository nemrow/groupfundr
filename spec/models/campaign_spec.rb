require 'spec_helper'

describe Campaign do

  before do 
    @campaign = FactoryGirl.create(:campaign)
  end

  context "create a new campaign" do
    it "should set the campaigns name" do
      @campaign.name.should == Campaign.first.name
    end

    it "should set the campaigns description" do
      @campaign.description.should == Campaign.first.description
    end

    it "should set the campaigns group_raised" do
      @campaign.group_raised.should == Campaign.first.group_raised
    end

    it "should set the campaigns deadline" do
      @campaign.deadline.should be_kind_of(Time)
    end
  end

  context "associate owner and participants to campaign" do
    before do
      @owner = FactoryGirl.create(:user)
      @participant_1 = FactoryGirl.create(:user)
    end

    it "should add campaign to owners owned_campaigns" do
      @owner.owned_campaigns << @campaign
      @owner.owned_campaigns.count.should == 1
      @campaign.owner.should == @owner
    end

    it "should add participants to campaign" do
      @campaign.participants << @participant_1
      @campaign.participants.count.should == 1
      @participant_1.joined_campaigns.count.should == 1
    end
  end

  context "assosciations" do
    it { should belong_to(:owner) }
    it { should have_many(:participants) }
    it { should have_many(:user_joined_campaigns) }
  end
end
