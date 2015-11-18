require 'calabash-cucumber/calabash_steps'

############
# Steps
############

Given(/^I see the contacts list screen$/) do
  step "The screen \"Contacts List\" appears"
end

When(/^I press on "([^"]*)" button$/) do |arg1|
	if arg1 == "Back"
		step "I go back"
	else 
		step "I touch the \"#{arg1}\" button"
	end
end

Then(/^The screen "([^"]*)" appears$/) do |screen|
 	case screen
		when "Edit Contact Details"
			wait_for { not query("UITableView accessibilityIdentifier:'com.vc.contactsEdit'").empty? }
		when "Contacts List"
			wait_for { not query("UITableView accessibilityIdentifier:'com.vc.contactsList'").empty? }
		when "Contact Details"
			wait_for { not query("UIView accessibilityIdentifier:'com.vc.contactDetails'").empty? }
	end
end

Then(/^I enter "([^"]*)" in the "([^"]*)" textfield$/) do |arg1, text_field_name|

	text_field_id = nil
	case text_field_name
		when "first name"
			text_field_id = "com.textfield.firstName"
		when "last name"
			text_field_id = "com.textfield.lastName"
	end

	#step "I clear \"#{text_field_id}\""
	clear_text("textField marked: '#{text_field_id}'")
	step "I fill in \"#{text_field_id}\" with \"#{arg1}\""
end

Then(/^I see the "([^"]*)" contact in the contact list$/) do |arg1|
 	step "I should see \"#{arg1}\""
 	expect(query("UITableViewCell accessibilityIdentifier:'com.cell.contactsList'").empty?).to be false
end

Given(/^I see at least one contact in the list$/) do
	step "I press on \"Add\" button"
	step "I enter \"Jon\" in the \"first name\" textfield"
	step "I enter \"Snow\" in the \"last name\" textfield"
	step "I press on \"Done\" button"
	expect(query("tableView", numberOfRowsInSection:0)[0]).to eq(1)
end

When(/^I press on first contact$/) do
	step "I touch \"com.cell.contactsList\""
end

Then(/^I see the "([^"]*)" contact in the contact details$/) do |arg1|
 	step "I should see \"#{arg1}\""
 	expect(query("UILabel accessibilityIdentifier:'com.label.contactDetails'").empty?).to be false
end

When(/^I remove the first contact$/) do
	touch("tableViewCell index:0 descendant tableViewCellEditControl")
	step "I touch the \"Delete\" button"
end

Then(/^Contacts list is empty$/) do
	expect(query("tableView", numberOfRowsInSection:0)[0]).to eq(0)
end