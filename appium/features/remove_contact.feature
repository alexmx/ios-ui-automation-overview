@remove_contact
Feature: Remove an existing contact from the contacts list
	In order to get rid of annoying contacts
	As I user
	I want to remove an existing contact from my contacts list

@s1 @remove_action
Scenario: User can remove an existing contact from the contacts list
	Given I see the contact list screen
	Given I see at least one contact in the list
	When I press on "Add" button
	Then The screen "Edit Contact Details" appears
	And I enter "Jon" in the "first name" textfield
	And I enter "Snow" in the "last name" textfield
	When I press on "Done" button
	Then I see the "Jon Snow" contact in the contact list
 

