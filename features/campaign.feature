# Feature: Creating a campaign

#   @blank_user
#   Scenario: Manager setting up a new campaign
#     Given I am logged in as a new user with no campaigns
#     When I click the 'New Campaign' link
#     And I fill in 'campaign[name]' with 'My First Campaign'
#     And I fill in 'campaign[description]' with 'My Description'
#     And I fill in 'campaign[deadline]' with '10/31/2013'
#     And click the 'Start Campaign' button
#     Then the page should show 'You have successfully started the "New Campaign" Campaign'