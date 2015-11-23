# iOS UI Automation Overview
An overview of popular iOS UI Automation solutions which will help you to decide which one to use.

Covered solutions:
* [x] **UI Tests (XCTest);**
* [x] **UI Automation;**
* [x] **Appium;**
* [x] **Calabash;**
* [ ] **KIF**

In order to present proper difference between automation solutions, the same app was covered with the same testing scenarios.
Demo application represents a simple **Contacts** app which allows us to perform basic CRUD operations over the *Contact* entity.

#### Demo app

Contact List | Contact Details | Edit Contact | Remove Contact
------------ | ------------- | ------------- | -------------
![Contact List](/assets/contact-list.png) | ![Contact Details](/assets/contact-details.png) | ![Edit Contact](/assets/contact-edit.png) | ![Remove Contact](/assets/contact-remove.png)

## Scenarios

**Add contact:**

```
Scenario: User can add a new contact in the contacts list
	Given I see the contacts list screen
	When I press on "Add" button
	Then The screen "Edit Contact Details" appears
	And I enter "Jon" in the "first name" textfield
	And I enter "Snow" in the "last name" textfield
	When I press on "Done" button
	Then I see the "Jon Snow" contact in the contact list
```

**Update contact:**

```
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

**Remove contact:**

```
Scenario: User can remove an existing contact from the contacts list
	Given I see the contacts list screen
	Given I see at least one contact in the list
	When I press on "Edit" button
	And I remove the first contact
	Then Contacts list is empty
```

## Installation
Make sure that `bundler` is installed on your machine:

```bash
# Check bundler version
bundler --version

# Install bundler if not installed
sudo gem install bundler
```

Afer `bundler` is installed run:
```bash
bundle install
```

For **Appium** we will need to install Appium server separately. For this demo we will use Appium server standalone app.
Check out [this guide](http://github.com) for more details related to Appium server installation.

![Appium Standalone App](/assets/appium.png)

## Run Tests

For all solutions there are two options to run the tests, first one is using `fastlane` and the second one is manuall run.

### UI Tests (XCTest)
UI tests were introduced in XCode 7. It is native solution which allows us to write UI tests using `Objective-C` or `Swift`.
Tests are located in `ContactsUITests` folder.

Run tests:
```bash
# Run using fastlane
fastlane test_xctests

# Run manually
xcodebuild -project Contacts.xcodeproj \
	-scheme "Contacts" \
	-sdk iphonesimulator \
	-destination 'platform=iOS Simulator,name=iPhone 6,OS=9.1'
	test
```
**Note:** UI tests can be run directly from Xcode: `Product -> Test`

### Appium
Appium is an open source test automation framework for use with native, hybrid and mobile web apps. It drives iOS and Android apps using the WebDriver protocol. Appium supports client libraries for multiple programming languages `Java`, `Python`, `Ruby`, `JavaScript`, `PHP` and `C#`. Tests were written in `Ruby` and are located in `appium` folder.

Run tests:
```bash
# Run using fastlane
fastlane test_appium

# Run manually
xcodebuild -project Contacts.xcodeproj \
	-scheme "Contacts" \
	-sdk iphonesimulator \
	-derivedDataPath "build"
	build

cd ../appium && cucumber
```
**Note:** Appium server should be running while running tests.

### Calabash
Calabash is an automated testing technology for Android and iOS native and hybrid applications. It is a free-to-use open source project that is developed and maintained by Xamarin. Calabash has two client libraries for `Ruby` and `Java`. Tests were written in `Ruby` and are located in `calabash` folder.

Run tests:
```bash
# Run using fastlane
fastlane test_calabash

# Run manually
xcodebuild -project Contacts.xcodeproj \
	-scheme "Contacts-cal" \
	-sdk iphonesimulator \
	-derivedDataPath "build"
	build

cd ../calabash && APP=\"../Build/Products/Debug-iphonesimulator/Contacts-cal.app\" cucumber
```
**Note:** Before running calabash tests disable firewall otherwise the prompt below will appear on every simulator run:
![Contact List](/assets/calabash-firewall.png)

### UI Automation
UI Automation is an old native solution which allows us to write UI tests using `JavaScript`.
Tests are located in `ui-automation` folder.

Run tests:
```bash
# Run using fastlane
fastlane test_ui_automation

# Run manually
xcodebuild -project Contacts.xcodeproj \
	-scheme "Contacts" \
	-sdk iphonesimulator \
	-derivedDataPath "build"
	build

cd ../ui-automation && ./run-tests.sh "../build/Products/Debug-iphonesimulator/Contacts-test.app" "iPhone 5s"
```
**Note:** Consider UI Tests (XCTest) solution instead of UI Automation as Apple has officially deprecated UI Automation in Xcode 7.

## References

* [Appium Github page](https://github.com/appium/appium);
* [Calabash iOS Github page](https://github.com/calabash/calabash-ios);
* [UI Automation API reference guide](https://developer.apple.com/library/ios/documentation/DeveloperTools/Reference/UIAutomationRef/);
* [UITests presentation at WWDC 2015](https://developer.apple.com/videos/play/wwdc2015-406/).

## License
This project is licensed under the terms of the MIT license. See the LICENSE file.
