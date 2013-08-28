Given(/^I am logged in as an existing campaign manager$/) do
  login_as_existing_user
  User.last.owned_campaigns.count.should == 1
end

Given(/^I am on my campaign page$/) do
  visit root_path
  click_link('My Campaigns')
  click_link('My First Campaign')
end