Feature: View aggregated list of all subscriptions

  Background:
    Given I start the app with "bin/cli-twitter"
    And I enter "Susan -> Hello everyone."
    And I enter "Bob -> Damn! We lost!"
    And I enter "Bob -> Good game though."
    And I enter "Charlie -> I'm in New York today! Anyone want to have a coffee?"

  Scenario: Display aggregated list of all subscriptions
    Given I enter "Charlie follows Bob"
    And I enter "Charlie follows Susan"
    When I enter "Charlie wall"
    Then I should see
    """
    Charlie - I'm in New York today! Anyone want to have a coffee?
    Bob - Good game though.
    Bob - Damn! We lost!
    Susan - Hello everyone.
    """
