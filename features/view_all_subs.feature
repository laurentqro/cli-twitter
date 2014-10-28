Feature: View aggregated list of all subscriptions

  Background:
    Given I start the app with "bin/cli-twitter"
    And I entered "Susan -> Hello everyone." 5 minutes ago
    And I entered "Bob -> Damn! We lost!" 2 minutes ago
    And I entered "Bob -> Good game though." 1 minutes ago
    And I entered "Charlie -> I'm in New York today! Anyone want to have a coffee?" 15 seconds ago

  Scenario: Display aggregated list of all subscriptions
    Given I enter "Charlie follows Bob"
    And I enter "Charlie follows Susan"
    When I enter "Charlie wall"
    Then I should see
    """
    Charlie - I'm in New York today! Anyone want to have a coffee? (15 seconds ago)
    Bob - Good game though. (1 minute ago)
    Bob - Damn! We lost! (2 minutes ago)
    Susan - Hello everyone. (5 minutes ago)
    """
