@add_contact
Feature: Create a new contact in the contacts list
	In order to interact with a new contact
	As I user
	I want to add a new contact in my contacts list

@s1 @add_action
Scenario: User can add a new contact in the contacts list
	Given I see the contacts list screen
	When I press on "Add" button
	Then The screen "Edit Contact Details" appears
	And I enter "Jon" in the "first name" textfield
	And I enter "Snow" in the "last name" textfield
	When I press on "Done" button
	Then I see the "Jon Snow" contact in the contact list
 

