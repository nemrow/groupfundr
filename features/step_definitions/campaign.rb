Given(/^I am logged in as a new user with no campaigns$/) do
  login_as_existing_user
end

When(/^click the 'Start Campaign' button$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I am not logged in as an existing campaign manager$/) do
  visit root_path
  page.should have_content('Sign In')
end

Given(/^I have been invited to join a campaign$/) do
  Invite.count.should == 1
end

Given(/^I am visit my specific invite link$/) do
  visit Invite.last.get_invite_url
end