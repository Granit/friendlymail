

Given /^I am filling register form with Login "([^\"]*)", Email "([^\"]*)", Password "([^\"]*)", Confirm Password "([^\"]*)"$/ do |login, email, password, confirm_password|
    fill_in "user_login", :with => login
    fill_in "user_email", :with => email
    fill_in "user_password", :with => password
    fill_in "user_password_confirmation", :with => confirm_password
    click_button "Sign up"
end

Then /^(?:|There )is user with Login "([^\"]*)", Email "([^\"]*)", Password "([^\"]*)", Confirm Password "([^\"]*)" in database$/ do |login, email, password, confirm_password|
u=User.new('login'=>login,:password=>password, :password_confirmation=>confirm_password, :email=>email)
u.save
end

Given /^I am signing up with Login "([^\"]*)", Password "([^\"]*)"$/ do |login, password|
    fill_in "login", :with => login
    fill_in "password", :with => password
    click_button "Log in"
end

Given /^I am filling new_message form with Recipient "([^\"]*)", Subject "([^\"]*)", Text "([^\"]*)"$/ do |message_recipient, message_subject, message_text|
    fill_in "message[recipient]", :with => message_recipient
    fill_in "message[subject]", :with => message_subject
    fill_in "message[text]", :with => message_text
    click_button "Save"
end

Given /^(?:|There )is message with Recipient "([^\"]*)", Subject "([^\"]*)", Text "([^\"]*)" for user with Login "([^\"]*)" in database$/ do |message_recipient, message_subject, message_text, user_login|
user=User.find_by_login(user_login.downcase)
m=Message.new(:recipient=>message_recipient, :subject=>message_subject, :text=>message_text, :user_id=>user.id)
m.save
m.errors
end


Then /^I should have ([0-9]+) "([^\"]*)"$/ do |count, tablename|
	puts "#{tablename}="+tablename.capitalize.constantize.all.count.to_s+" | #{count}"
	tablename.capitalize.constantize.all.count.should == count.to_i
end

