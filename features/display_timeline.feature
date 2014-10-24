Feature: Display a user's personal timeline

  Background:
    Given I start the app with "bin/cli-twitter"

  Scenario: Display timeline
    Given I enter "Alice -> I love the weather today."
    When I enter "Alice"
    Then I should see
    """
    I love the weather today.
    """

