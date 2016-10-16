@rt
@javascript
Feature: Emulation
  Tests for emulation functionality.

  Scenario Outline: Emulate user
    Given I visit Gold
    Then I log in as a <user_type>
    Then I click the "Administration" link
    Then I click the "Users" link
    Then I search for "G2-Auto-Teacher1"
    Then I click the "Emulate User" link
    Then I verify the user "G2-Auto-Teacher1" was emulated

    Examples:
      | user_type                |
      | "Agency Org Admin"       |