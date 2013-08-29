Feature: Invite participants to campaign and join campaigns

  @blank_user @campaign
  Scenario: Invite new participant to campaign
    Given I am logged in as an existing campaign manager
    And I am on my campaign page
    When I fill in 'invite[name]' with 'Jordan'
    And I fill in 'invite[email]' with 'nemrowj@gmail.com'
    And I click the 'Send Invite' button
    Then the page should show 'Invite to Jordan sent successfully'

  @blank_user @blank_participant @campaign @campaign_invite
  Scenario: Accept an invite as an existing customer not logged in
    Given I am not logged in as an existing user
    And I have been invited to join a campaign
    And I am visit my specific invite link
    When I click the 'Join This Campaign' link
    And I click the 'Existing User' link
    And I fill in 'user[email]' with 'barry@nemrow.com'
    And I fill in 'user[password]' with 'password'
    And I click the 'Sign In' button
    And I click the 'My Campaigns' link
    Then the page should show 'My First Campaign'

  @blank_user @blank_participant @campaign @campaign_invite
  Scenario: Accept an invite as an existing customer with login fuckup
    Given I am not logged in as an existing user
    And I have been invited to join a campaign
    And I am visit my specific invite link
    When I click the 'Join This Campaign' link
    And I click the 'Existing User' link
    And I fill in 'user[email]' with 'bay@nemrow.com'
    And I fill in 'user[password]' with 'password'
    And I click the 'Sign In' button
    And I fill in 'user[email]' with 'barry@nemrow.com'
    And I fill in 'user[password]' with 'password'
    And I click the 'Sign In' button
    And I click the 'My Campaigns' link
    Then the page should show 'My First Campaign'

  @blank_user @campaign @campaign_invite
  Scenario: Accept an invite as a new user
    Given I am not a current user
    And I have been invited to join a campaign
    And I am visit my specific invite link
    When I click the 'Join This Campaign' link
    And I click the 'New User' link
    And I fill in 'user[first_name]' with 'Barry'
    And I fill in 'user[last_name]' with 'Nemrow'
    And I fill in 'user[email]' with 'barry@nemrow.com'
    And I fill in 'user[password]' with 'password'
    And I click the 'Sign Up' button
    And I click the 'My Campaigns' link
    Then the page should show 'My First Campaign'

  @blank_user @campaign @campaign_invite
  Scenario: Accept an invite as a new user with signup fuckup
    Given I am not a current user
    And I have been invited to join a campaign
    And I am visit my specific invite link
    When I click the 'Join This Campaign' link
    And I click the 'New User' link
    And I fill in 'user[first_name]' with 'Barry'
    And I fill in 'user[last_name]' with 'Nemrow'
    And I fill in 'user[email]' with 'barry@nemrow.com'
    And I fill in 'user[password]' with ''
    And I click the 'Sign Up' button
    And I fill in 'user[first_name]' with 'Barry'
    And I fill in 'user[last_name]' with 'Nemrow'
    And I fill in 'user[email]' with 'barry@nemrow.com'
    And I fill in 'user[password]' with 'password'
    And I click the 'Sign Up' button
    And I click the 'My Campaigns' link
    Then the page should show 'My First Campaign'


