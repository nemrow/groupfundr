require 'spec_helper'

describe User do
  context "add user to database" do
    before do
      @user = FactoryGirl.create(:user)
    end

    it "should set users first name" do
      User.first.first_name.should == @user.first_name
    end

    it "should set users first name" do
      User.first.last_name.should == @user.last_name
    end

    it "should set users first name" do
      User.first.email.should == @user.email
    end

    it "should set users first name" do
      @user.authenticate('password').should == @user
    end
  end

  context "assosciations" do
    it { should have_many(:owned_campaigns) }
    it { should have_many(:joined_campaigns) }
    it { should have_many(:user_joined_campaigns) }
  end
end
