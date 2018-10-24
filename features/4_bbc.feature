@bbc @all_env
Feature: Example Feature
When I want to learn how to make test cases
As a user of the test automation tool
I want to run and adjust the tests below

  @bbc_01
  Scenario: example01 - BBC navigate
    Given the user goes to the "home"
    When the page loads
    Then header "Welcome to BBC.com" should display on the top of the page

  @bbc_02
  Scenario: example02 - BBC see registration option
    Given the unregistered-user
    When the user navigates to "home"
    Then the registration button is visible

  @bbc_02a
  Scenario: example02a - BBC able to register
    Given the unregistered-user navigates to "home"
    When the user navigates to the registration page
    Then the registration form should be displayed

  @bbc_03
  Scenario: example03 - BBC see log out option
    Given the user is logged in
    When the user navigates to his account profile
    Then the log out button should be displayed


