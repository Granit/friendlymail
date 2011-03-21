Feature: Manage All
 In order to make an cardsite
 As a author
 I want to create and manage cardholders and their cards
 

         Scenario Outline: asign a new user
    Given I should have 0 "user"
    And I am on the root page
    And I should see "You are currently not logged in"
    When I press "Sign up"
    Then I should see "Sign up as a new user"
    Given I am filling register form with Login "<user_login>", Email "<user_email>", Password "<user_password>", Confirm Password "<user_password>"
    Then I should see "Thanks for signing up"
    Then I should have 1 "user"
    Examples:
      | user_login | user_email | user_password |
      | IvanovSidor |  ivanow@gmail.ru | pa123451f2346 |
      
         Scenario Outline: log in by user
    Given I am on the root page
    And I should see "You are currently not logged in"
    And There is user with Login "<user_login>", Email "<user_email>", Password "<user_password>", Confirm Password "<user_password>" in database
    Then I should have 1 "user"
    When I press "Log in"
    Then I should see "Remember me"
    And I should see "Log In"
    Given I am signing up with Login "<user_login>", Password "<user_password>"
    Then I should see "You are logged in as"
    And I should see "Logout"
    Examples:
      | user_login | user_email | user_password |
      | IvanovSidor |  ivanow@gmail.ru | pa123451f2346 |
      
         Scenario Outline: adding message by user
    Given There is user with Login "<user_login>", Email "<user_email>", Password "<user_password>", Confirm Password "<user_password>" in database
    And I am on the root page
    And I press "Log in"
    When I am signing up with Login "<user_login>", Password "<user_password>"
    Then I should see "You are logged in as"
    Given I am on the messages page
    Then I should see "Your Messages"
	And I should see "new messages 0"
    When I press "New message"
    Then I should see "New message"
    Given I am filling new_message form with Recipient "<message_recipient>", Subject "<message_subject>", Text "<message_text>"
    Then I should see "Show message"
    And I should see "<message_recipient>"
    And I should see "Destroy"
    When I am on the messages page
    Then I should see "new messages 1"
    Examples:
      | user_login | user_email | user_password | message_recipient | message_subject | message_text |
      | IvanovSidor |  ivanow@gmail.ru | pa123451f2346 | recip@mail.ru | m_subj_ect ge | Its a very large message text |
      
         Scenario Outline: adding message by user
    Given There is user with Login "<user_login>", Email "<user_email>", Password "<user_password>", Confirm Password "<user_password>" in database
    And I am on the root page
    And I press "Log in"
    When I am signing up with Login "<user_login>", Password "<user_password>"
    Then I should see "You are logged in as"
    Given I am on the messages page
    Then I should see "Your Messages"
	And I should see "new messages 0"
    When I press "New message"
    Then I should see "New message"
    Given I am filling new_message form with Recipient "<message_recipient>", Subject "<message_subject>", Text "<message_text>"
    Then I should see "Show message"
    And I should see "<message_recipient>"
    And I should see "Destroy"
    When I am on the messages page
    Then I should see "new messages 1"
    Examples:
      | user_login | user_email | user_password | message_recipient | message_subject | message_text |
      | IvanovSidor |  ivanow@gmail.ru | pa123451f2346 | recip@mail.ru | m_subj_ect ge | Its a very large message text | 
      
         Scenario Outline: mark exisiting message by user
    Given There is user with Login "<user_login>", Email "<user_email>", Password "<user_password>", Confirm Password "<user_password>" in database
    And I am on the root page
    And I press "Log in"
    When I am signing up with Login "<user_login>", Password "<user_password>"
    Then I should see "You are logged in as"
    Given I am on the messages page
    Given There is message with Recipient "<message_recipient>", Subject "<message_subject>", Text "<message_text>" for user with Login "<user_login>" in database    
    When I am on the messages page
    Then I should see "new messages 1"
    #Then the "message_ids_" checkbox should not be checked
    Examples:
      | user_login | user_email | user_password | message_recipient | message_subject | message_text |
      | IvanovSidor |  ivanow@gmail.ru | pa123451f2346 | recip@mail.ru | m_subj_ect ge | Its a very large message text |      
