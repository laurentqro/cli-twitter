Feature: Display a user's personal timeline

  Scenario: Display timeline message
    Given "Alice" posted "I love the weather today." 5 minutes ago
    When I check "Alice"'s timeline
    Then I should see
    """
    I love the weather today. (5 minutes ago)
    """

