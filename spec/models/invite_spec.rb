require 'spec_helper'

describe Invite do
  context "Should create functional invites" do
    before do
      @owner = FactoryGirl.create(:user)
      @campaign = FactoryGirl.create(:campaign)
      @campaign.owner = @owner
      @invite = FactoryGirl.create(:invite)
    end

    it "should should set invite name" do
      @invite.name.should == Invite.last.name
    end

    it "should should set invite email" do
      @invite.email.should == Invite.last.email
    end

    it "should should set invite token" do
      @invite.token.should == Invite.last.token
    end

    it "should should set invite expired to false" do
      @invite.expired.should == Invite.last.expired
      Invite.last.expired.should == false
    end
  end
  
  it { should belong_to(:campaign) }
end
