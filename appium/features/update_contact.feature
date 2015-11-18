@update_contact
Feature: Update an existing contact in the contacts list
	In order to keep all my contacts up-to-date
	As I user
	I want to update an existing contact in my contacts list

@s1 @update_action
Scenario: User can update an existing contact in the contacts list
	Given I see the contacts list screen
	Given I see at least one contact in the list
	When I press on first contact
	Then The screen "Contact Details" appears
	When I press on "Edit" button
	Then The screen "Edit Contact Details" appears
	And I enter "Robb" in the "first name" textfield
	And I enter "Stark" in the "last name" textfield
	When I press on "Done" button
	Then The screen "Contact Details" appears
	And I see the "Robb Stark" contact in the contact details
	When I press on "Back" button
	Then I see the "Robb Stark" contact in the contact list
 

