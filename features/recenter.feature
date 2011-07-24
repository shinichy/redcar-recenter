Feature: Recenter

  Background:
    When I open a new edit tab
    When I replace the contents with 100 lines of "hoge" then "foo"
    When number of visible lines is 30

  Scenario: Recenter when the cursor is at lower half of viewport
    And I move to line 30
    And I run the command Redcar::MyPlugin::RecenterCommand
    Then the cursor should be on line 30
    Then line number 16 should be smallest visible line
    Then line number 45 should be biggest visible line

  Scenario: Recenter when the cursor is on line 10
    And I move to line 10
    And I run the command Redcar::MyPlugin::RecenterCommand
    Then the cursor should be on line 10
    Then line number 0 should be smallest visible line
    Then line number 29 should be biggest visible line

  Scenario: Recenter when the cursor is on line 95
    And I move to line 95
    And I run the command Redcar::MyPlugin::RecenterCommand
    Then the cursor should be on line 95
    Then line number 71 should be smallest visible line
    Then line number 100 should be biggest visible line
