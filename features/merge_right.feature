Feature: Article Merging Rights
  As an administrator
  In order to merge two articles with the same topic or similar content
  I want to check I have the right to do merging

  Background: 
    Given the blog is set up
    Given a publisher is created

  Scenario: A non-admin cannot merge articles
    Given I am logged in as publisher
    And I create a First article
    When I am on the Edit page for First
    Then I should not see "Merge Articles"

  Scenario: An admin can merge articles
    Given I am logged into the admin panel
    And I create a First article
    And I am on the Edit page for First
    Then I should see "Merge Articles"