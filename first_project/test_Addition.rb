require 'test/unit'
require 'selenium-webdriver'
class TestAddition < Test::Unit::TestCase

def setup
  @driver = Selenium::WebDriver.for :chrome
  @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  @driver.navigate.to("http://demo.redmine.org/")
  @driver.manage.window.maximize
  @username = 'niceday'
  @password = 'password'
  @newpassword = 'newpassword'
  @username2 = 'bigday'
end

def test_login
  login(@username)
  expected_result = 'Logged in as ' + @username
  actual_result = @driver.find_element(:id, 'loggedas').text
  assert_equal(expected_result, actual_result)
end

def test_register
  register
  expected_result = 'Your account has been activated. You can now log in.'
  actual_result = @driver.find_element(:id, 'flash_notice').text
  assert_equal(expected_result, actual_result)
end

def test_logout
  login(@username)
  logout
  expected_result = 'Sign in'
  actual_result = @driver.find_element(:class, 'login').text
  assert_equal(expected_result, actual_result)
end

def test_change_password
  login(@username, @password)
  change_password(@newpassword, @password)
  expected_result = 'Password was successfully updated.'
  actual_result = @driver.find_element(:id, 'flash_notice').text
  assert_equal(expected_result, actual_result)
  sleep 2
  change_password(@password, @newpassword) #clean up, change back password
end

def test_create_project
  login(@username, @password)
    project_name = 'name of the project'+rand(1000).to_s
  project_description = 'project_description bla bla'
  initiate_new_project
  fill_up_new_project_form(project_name, project_description)
  expected_result = 'Successful creation.'
  actual_result = @driver.find_element(:id, 'flash_notice').text
  assert_equal(expected_result, actual_result)
end

# def test_add_member_to_project
#
#   login(@username, @password)
#   navigate_to_home
#   select_project
#   navigate_to_main_menu('settings')
#   @driver.find_element(:id, 'tab-members').click
#   sleep 2
#   @driver.find_element(:xpath, "//div[@id='tab-content-members']//a[@class='icon icon-add']").click
#   sleep3
#   @driver.find_element(:id, 'principal_search').send_keys(@username2)
# end
#
# def test_create_project_version
#   create_project_version
# end


def create_project_version
  login(@username, @password)
  navigate_to_home
  select_project
  navigate_to_main_menu('settings')
  sleep 2
  navigate_to_project_tab_menu('Versions')
  sleep 4
  add_new


end

def add_new
  @driver.find_element(:xpath, "//div[@id='tab-content-members']//a[@class='icon icon-add']").click

end

def navigate_to_project_tab_menu(tabname)
  @driver.find_element(:xpath, "//div[@class='tabs']//a[text()='" + tabname + "']").click
end
def navigate_to_main_menu(tab)
  @driver.find_element(:xpath, "//div[@id='main-menu']//a[@class='"+ tab +"']").click
end


def select_project
  @driver.find_element(:xpath, "//select/option[text()='name of the project682']").click
end

def navigate_to_home
  @driver.find_element(:class, 'home').click
end

def initiate_new_project
  @driver.find_element(:class, 'projects').click
  @driver.find_element(:class, 'icon-add').click
end

def fill_up_new_project_form (project_name, project_description)
  @driver.find_element(:id, 'project_name').send_keys(project_name)
  @driver.find_element(:id, 'project_description').send_keys(project_description)
  @driver.find_element(:name, 'commit').click
end

def change_password(newpassword, oldpassword)
  @driver.find_element(:class, 'my-account').click
  @driver.find_element(:class, 'icon-passwd').click
  @driver.find_element(:name, 'password').send_keys(oldpassword)
  @driver.find_element(:name, 'new_password').send_keys(newpassword)
  @driver.find_element(:name, 'new_password_confirmation').send_keys(newpassword)
  @driver.find_element(:name, 'commit').click
end

def logout
  @driver.find_element(:class, 'logout').click
end

def register
  @driver.navigate.to("http://demo.redmine.org/")
  @driver.find_element(:class, 'register').click
  @driver.find_element(:id, 'user_login').send_keys('niceday' +rand(10000).to_s)
  @driver.find_element(:id, 'user_password').send_keys('password')
  @driver.find_element(:id, 'user_password_confirmation').send_keys('password')
  @driver.find_element(:id, 'user_firstname').send_keys('Big')
  @driver.find_element(:id, 'user_lastname').send_keys('Day')
  @driver.find_element(:id, 'user_mail').send_keys(rand(10000).to_s + 'nice@day.com')
  @driver.find_element(:name, 'commit').click
end

  def login(username, password='password')
    @driver.find_element(:class, 'login').click
    @driver.find_element(:id, 'username').send_keys(username)
    @driver.find_element(:id, 'password').send_keys(password)
    @driver.find_element(:name, 'login' ).click
  end

def teardown
 #@driver.quit
end

end