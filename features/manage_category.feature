Feature: manage categories
  As the admin of blog
  In order to check articles overall
  I want to manage the article categories of my blog
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel
    
  Scenario: Admin go to the admin page
    When I go to the admin page
    Then I should see "Welcome back, admin!"

  Scenario: Successfully access to the Category page
    When I go to the new category page
    Then I should see "Categories"
    
  Scenario: Successfully create Category
    When I go to the new category page
    And I fill in "category_name" with "Gundam"
    And I fill in "category_description" with "Description"
    And I press "Save"
    Then I should be on the new category page
    And I should see "Gundam"
    And I should see "Description"
    
  Scenario: Edit the name of an existing category 
    Given that Gundam categories are added
    And I am on the new category page
    When I follow "Gundam"
    Then the "category_name" field should contain "Gundam"
    When I fill in the following:
      | Keywords | 00, SEED |
    And I press "Save"
    Then I should be on the new category page
    And I should see "00, SEED"    
    
    
  Scenario: Edit the description and permalink of an existing category
    Given I am on the edit home category page
    When I follow "Edit"
    And I fill in "category_description" with "Foobar"
    And I fill in "category_permalink" with "barFoo"
    And I press "Save"
    Then I should see "Foobar"
    And I should see "barFoo"