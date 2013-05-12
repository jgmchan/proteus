Feature: Set local git
    Scenario: Set local git settings
        Given I am inside a git project
        And There are no local user name set
        And There are no local user email set
        When I execute a git command
        Then The local user.name will be set to "Jeffrey"
        And The local user.email will be set to "jeffrey.chan@team.telstra.com"

Feature: Not inside a git repository
    Scenario: 
        Given I am not inside a git project
        When I execute a git command
        Then nothing will be executed

Feature: No remote origin
    Scenario:
        Given I am inside a git project
        And There are no remote origins set
        When I execute a git command
        Then I will be prompted to choose which user once


