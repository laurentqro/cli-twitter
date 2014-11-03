Feature: View aggregated list of all subscriptions

  Background:
    Given "Susan" posted "Hello everyone." 5 minutes ago
    And "Bob" posted "Damn! We lost!" 2 minutes ago
    And "Bob" posted "Good game though." 1 minute ago
    And "Charlie" posted "I'm in New York today! Anyone want to have a coffee?" 15 seconds ago

  Scenario: Display aggregated list of all subscriptions
    Given "Charlie" follows "Bob"
    And "Charlie" follows "Susan"
    When I check "Charlie"'s wall
    Then I should see
    """
    Charlie - I'm in New York today! Anyone want to have a coffee? (15 seconds ago)
    Bob - Good game though. (1 minute ago)
    Bob - Damn! We lost! (2 minutes ago)
    Susan - Hello everyone. (5 minutes ago)
    """
