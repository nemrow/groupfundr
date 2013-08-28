Given(/^I am an existing user not logged in$/) do
  User.count.should == 1
  visit root_path
end