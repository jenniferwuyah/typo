Feature: Article Merging Rights
  As an administrator
  In order to merge two articles with the same topic or similar content
  I want to merge the articles into one while preserving both contents

  Background: 
    Given the blog is set up
    Given a publisher is created
    When I am logged in as publisher
    And I create a PubOne article
    And I follow "Log out"
    Then I am logged into the admin panel
    And I create a AdminOne article

    Then I post a "cool" comment to PubOne
    And I post a "wow" comment to PubOne
    And I post a "eh" comment to AdminOne

  Scenario: Merged article should contain the text of both previous articles
    When I merge PubOne into AdminOne
    Then I go to the admin content page
    And I should see "AdminOne"
    When I follow "Show"
    Then I should see "Content of AdminOne"
    And I should see "Content of PubOne"


  Scenario: Merged article should have one author
    When I merge PubOne into AdminOne
    Then I go to the admin content page
    Then the author of AdminOne should be admin


  Scenario: Comments of the original articles are carried over
    When I merge PubOne into AdminOne
    Then I go to the admin content page
    And I should see "AdminOne"
    When I follow "Show"
    Then I should see "eh"
    And I should see "cool"
    And I should see "wow"
    

  Scenario: The title of the new article should be the title from either one of the merged articles
    When I merge PubOne into AdminOne
    Then I go to the admin content page
    And I should see "AdminOne"
    But I should not see "PubOne"