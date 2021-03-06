Feature: Login / Logout
  
  @blank_user
  Scenario: Login with good credentials
    Given I am an existing user not logged in
    And I click the 'Sign In' link
    And I fill in 'user[email]' with 'nemrowj@gmail.com'
    And I fill in 'user[password]' with 'password'
    And I click the 'Sign In' button
    Then the page should show 'Hello Jordan'
    And the page should show 'Sign Out'

  @blank_user
  Scenario: Login with bad password
    Given I am an existing user not logged in
    And I click the 'Sign In' link
    And I fill in 'user[email]' with 'nemrowj@gmail.com'
    And I fill in 'user[password]' with 'badpassword'
    And I click the 'Sign In' button
    Then the page should show 'Sign In'
    And the page should show 'Incorrect Password'

  @blank_user
  Scenario: Login with bad email
    Given I am an existing user not logged in
    And I click the 'Sign In' link
    And I fill in 'user[email]' with 'wrong@gmail.com'
    And I fill in 'user[password]' with 'password'
    And I click the 'Sign In' button
    Then the page should show 'Sign In'
    And the page should show 'Incorrect Email'

  @blank_user
  Scenario: Signing Out
    Given I am logged in as an existing blank user
    When I click the 'Sign Out' link
    Then the page should show 'Sign In'