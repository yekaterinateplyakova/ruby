Then(/^I verify the user \s*"([^"]*)" was emulated$/) do |name|
  expected_text = name
  page_text = find(:id, 'global_teacher_id').text.split[0]
  puts expected_text
  puts page_text
  fail "page text #{page_text} not matching expected #{expected_text}" unless expected_text == page_text
end

Given(/^I visit Gold$/) do
  visit CONFIG['g2']
end

Given(/log in as a\s*"([^"]*)"$/) do |keyword|
  user_list = get_users_for_env()
  $current_userType = keyword

  begin
    username = user_list[keyword]["username"]
  rescue
    raise "Unable to find user type '#{keyword}' in table... make sure this isn't a username."
  end

  password = user_list[keyword]["password"]

  if password.nil?
    # default password
    sign_in(username)
  else
    # custom password
    sign_in(username, password)
  end
end
Then (/^I search for \s*"([^"]*)"$/) do |name|
  search_user(name)
end
 Given(/click the "([^"]*)" (link|button)$/) do |arg1, arg2|
  if arg2 == "link"
    click_link arg1
  else
    click_button arg1
  end
end