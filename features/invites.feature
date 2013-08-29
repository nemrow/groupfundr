Feature: Invite participants to campaign

  @blank_user @campaign_owner
  Scenario: Invite new participant to campaign
    Given I am logged in as an existing campaign manager
    And I am on my campaign page
    When I fill in 'invite[name]' with 'Jordan'
    And I fill in 'invite[email]' with 'nemrowj@gmail.com'
    And I click the 'Send Invite' button
    Then the page should show 'Invite to Jordan sent successfully'
