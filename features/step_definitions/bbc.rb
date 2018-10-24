Given(/^the user goes to the (?:the )?"(.*?)"(?: page)?$/) do |page|
  Nav.to(page)
end

When(/^the page loads$/) do
  browser.wait(:like => [:h2, :class, 'module__title'])
end

Then /^header "(.*?)" should display on the top of the page$/ do |expected_text|
  header = browser.wait(:like => [:h2, :class, 'module__title'])

  if header.html.include?('Welcome to BBC.com')
    puts "yes you found '#{@youfoundit}'"
  else
    raise "Ouch 'Welcome to BBC.com'"
  end
end

Given(/^the unregistered-user?$/) do
  Nav.to('https://account.bbc.com/signout')
  # @youfoundlogin = browser.find('Sign in').text
  # if @youfoundlogin
  #   puts "you found log in"
  # end
end

When(/^the user navigates to (?:the )?"(.*?)"(?: page)$/) do |page|
  Nav.to(page)
  # browser.wait(
  #     :like => [:a, :id, 'idcta-link'],
  # ).click
end

Then /^the registration button is visible$/ do
  begin
    browser.find(:like => [:a, :class, 'link link--primary'])
  rescue
    raise "There is not a sign out buttton"
  end
  # @signinbutton = browser.wait(
  #     :like => [:button, :id, 'submit-button'],
  # )
  # if @signinbutton
  #   puts "you are in the registration form"
  # end
end

Given(/^the unregistered-user navigates to (?:the )?"(.*?)"(?: page)?$/) do |page|
  Nav.to('https://account.bbc.com/signout')
  Nav.to (page)
  # @youfoundlogin = browser.find('Sign in').text
  # if @youfoundlogin
  #   puts "you found log in"
  # end
end

When(/^the user navigates to the registration page$/) do
  Nav.to('https://account.bbc.com/signin')

  browser.wait(
      :like => [:a, :class, 'link link--primary'],
  ).click

  browser.find(
      :like => [:a, :class, 'button'],
      :pick => :last
  ).click

  convertday = browser.find(
      :like => [:input, :id, 'day-input'],
  ).to_subtype
  convertday.set "09"

  convertmonth = browser.find(
      :like => [:input, :id, 'month-input'],
  ).to_subtype
  convertmonth.set "10"

  convertyear = browser.find(
      :like => [:input, :id, 'year-input'],
  ).to_subtype
  convertyear.set "1988"

  browser.find(
      :like => [:button, :id, 'submit-button'],
      :pick => :last
  ).click


end

Then /^the registration form should be displayed$/ do
  browser.wait(
      :like => [:button, :id, 'submit-button'],
  )


  # @signinbutton = browser.wait(
  #     :like => [:button, :id, 'submit-button'],
  # )
  # if @signinbutton
  #   puts "you are in the registration form"
  # end
end

Given(/^the user is logged in?$/) do
  Nav.to('http://www.bbc.com/')
  browser.find(
      :like => [:a, :id, 'idcta-link'],
  ).click

  @convertemail = browser.find(
      :like => [:input, :id, 'user-identifier-input'],
  ).to_subtype
  @convertemail.set "marinos.petratos@spritecloud.com"

  @convertpassword = browser.find(
      :like => [:input, :id, 'password-input'],
  ).to_subtype

  @convertpassword.set "a2106821"

  browser.find(
      :like => [:button, :id, 'submit-button'],
  ).click


end

When(/^the user navigates to his account profile$/) do
  browser.wait(
      :like => [:a, :id, 'idcta-link'],
  ).click
end

Then /^the log out button should be displayed$/ do
  browser.wait(
      :like => [:a, :class, 'link link--primary primary-nav__link'],
  )
end