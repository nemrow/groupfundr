Given(/^I am not a current user$/) do
  page.should_not have_content("Hello Jordan")
end

When(/^I click the '(.*)' link$/) do |value|
  click_link(value)
end

When(/^I fill in '(.*)' with '(.*)'$/) do |field_name, value|
  fill_in field_name, :with => value
end

When(/^I click the '(.*)' button$/) do |value|
  click_button(value)
end

Then(/^the page should show '(.*)'$/) do |content|
  page.should have_content(content)
end

When(/^show page$/) do 
  save_and_open_page
end

Given(/^I am logged in as an existing blank user$/) do
  login_as_existing_user
end