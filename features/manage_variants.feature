@variants
Feature: Variants
  In order to have variants on my website
  As an administrator
  I want to manage variants

  Background:
    Given I am a logged in refinery user
    And I have no variants

  @variants-list @list
  Scenario: Variants List
   Given I have variants titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of variants
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @variants-valid @valid
  Scenario: Create Valid Variant
    When I go to the list of variants
    And I follow "Add New Variant"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 variant

  @variants-invalid @invalid
  Scenario: Create Invalid Variant (without name)
    When I go to the list of variants
    And I follow "Add New Variant"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 variants

  @variants-edit @edit
  Scenario: Edit Existing Variant
    Given I have variants titled "A name"
    When I go to the list of variants
    And I follow "Edit this variant" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of variants
    And I should not see "A name"

  @variants-duplicate @duplicate
  Scenario: Create Duplicate Variant
    Given I only have variants titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of variants
    And I follow "Add New Variant"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 variants

  @variants-delete @delete
  Scenario: Delete Variant
    Given I only have variants titled UniqueTitleOne
    When I go to the list of variants
    And I follow "Remove this variant forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 variants
 