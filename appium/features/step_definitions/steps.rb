############
# Helpers
############

def keyboard_visible? 
  keyboard = execute_script "UIATarget.localTarget().frontMostApp().keyboard()"
  return keyboard != ""
end

def keyboard_type_string string
  execute_script "UIATarget.localTarget().frontMostApp().keyboard().typeString(\"#{string}\")"
end

############
# Steps
############

Given(/^I see the contacts list screen$/) do
  step "The screen \"Contacts List\" appears"
end

When(/^I press on "([^"]*)" button$/) do |arg1|
  wait { button(arg1).click }
end

Then(/^The screen "([^"]*)" appears$/) do |screen|
 	case screen
		when "Edit Contact Details"
			wait { find("com.vc.contactsEdit") }
		when "Contacts List"
			wait { find("com.vc.contactsList") }
		when "Contact Details"
			wait { find("com.vc.contactDetails") }
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

	text_field = nil
	wait { text_field = textfield(text_field_id) }
	set_immediate_value(text_field, "")
	text_field.click
	wait_true { keyboard_visible?() }
	keyboard_type_string(arg1)
end

Then(/^I see the "([^"]*)" contact in the contact list$/) do |arg1|
 	cell = nil
 	wait { cell = find_ele_by_attr("UIATableCell", "label", arg1) }
 	expect(cell.name()).to eq("com.cell.contactsList")
end

Given(/^I see at least one contact in the list$/) do
	step "I press on \"Add\" button"
	step "I enter \"Jon\" in the \"first name\" textfield"
	step "I enter \"Snow\" in the \"last name\" textfield"
	step "I press on \"Done\" button"
	expect(tags("UIATableCell").length()).to eq(1)
end

When(/^I press on first contact$/) do
  	wait { tags("UIATableCell")[0].click }
end

Then(/^I see the "([^"]*)" contact in the contact details$/) do |arg1|
 	label = nil
 	wait { label = find_ele_by_attr("UIAStaticText", "label", arg1) }
 	expect(label.name()).to eq("com.label.contactDetails")
end

When(/^I remove the first contact$/) do
	wait { find_eles_by_attr("UIAButton", "hint", "Double tap to delete item")[0].click }
	wait { button("Delete").click }
end

Then(/^Contacts list is empty$/) do
	expect(tags("UIATableCell").length()).to eq(0)
end