Feature: Display a user's personal timeline

  Background:
    Given I start the app with "bin/cli-twitter"

  Scenario: Display timeline message
    Given I entered "Alice -> I love the weather today." 5 minutes ago
    When I enter "Alice"
    Then I should see
    """
    I love the weather today. (5 minutes ago)
    """

