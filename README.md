# iOS UI Automation Overview
An overview of popular iOS UI Automation solutions which will help you to decide which one to use.

Covered solutions:
* **UI Tests (XCTest);**
* **UI Automation;**
* **Appium;**
* **Calabash.**

In order to present proper difference between automation solutions, the same app was covered with the same testing scenarios.
Demo application represents a simple **Contacts** app which allows us to perform basic CRUD operations over the *Contact* entity.

#### Demo app

Contact List | Contact Details | Edit Contact | Remove Contact
------------ | ------------- | ------------- | -------------
![Contact List](/assets/contact-list.png) | ![Contact Details](/assets/contact-details.png) | ![Edit Contact](/assets/contact-edit.png) | ![Remove Contact](/assets/contact-remove.png)

#### Scenarios

Add contact:

```gherkin
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
```

Update contact:

```gherkin
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
```

Remove contact:

```gherkin
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
```
