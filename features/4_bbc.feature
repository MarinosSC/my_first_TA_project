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
  Scenario: example02 - BBC opening the registration form
    Given the user is not logged in
    When the user clicks on the log in button
    Then the registration form should be displayed

  @bbc_03
  Scenario: example03 - BBC succesful log in
    Given the user is logged in
    When the user clicks on the account button
    Then the log out button should be displayed


