@remove_contact
Feature: Remove an existing contact from the contacts list
	In order to get rid of annoying contacts
	As I user
	I want to remove an existing contact from my contacts list

@s1 @remove_action
Scenario: User can remove an existing contact from the contacts list
	Given I see the contacts list screen
	Given I see at least one contact in the list
	When I press on "Edit" button
	And I remove the first contact
	Then Contacts list is empty
 

