# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_joined_campaign, :class => 'UserJoinedCampaigns' do
    user_id 1
    campaign_id 1
    goal "9.99"
    raised "9.99"
    link "MyString"
  end
end
