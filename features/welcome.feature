Feature: Signing up
  
  Scenario: Signing up with correct info
    Given I am on the hompage trying to sign up
    And I am not a current user
    When I click the 'Sign Up' link
    And I fill in 'user[first_name]' with 'Jordan'
    And I fill in 'user[last_name]' with 'Nemrow'
    And I fill in 'user[email]' with 'nemrowj@gmail.com'
    And I fill in 'user[password]' with 'password'
    And I click the 'Sign Up' button
    Then the page should show 'Welcome to Groupfundr Jordan!'

    Scenario: Signing up without password
      Given I am on the hompage trying to sign up
      And I am not a current user
      When I click the 'Sign Up' link
      And I fill in 'user[first_name]' with 'Jordan'
      And I fill in 'user[last_name]' with 'Nemrow'
      And I fill in 'user[email]' with 'nemrowj@gmail.com'
      And I click the 'Sign Up' button
      Then the page should show 'There was an error signing up'
