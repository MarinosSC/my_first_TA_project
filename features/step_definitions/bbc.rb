Given(/^the user goes to the (?:the )?"(.*?)"(?: page)?$/) do |page|
  Nav.to(page)
end

When(/^the page loads$/) do
  browser.wait(:like => [:h2, :class, 'module__title'])
  @youfoundit = browser.find('Welcome to BBC.com').text

end

Then /^header "(.*?)" should display on the top of the page$/ do |expected_text|
  if @youfoundit
    puts "yes you found '#{@youfoundit}'"
  end
end

Given(/^the user is not logged in?$/) do
  Nav.to('http://www.bbc.com/')
  @youfoundlogin = browser.find('Sign in').text
  if @youfoundlogin
    puts "you found log in"
  end
end

When(/^the user clicks on the log in button$/) do
  browser.wait(
      :like => [:a, :id, 'idcta-link'],
  ).click
end
#
Then /^the registration form should be displayed$/ do
  @signinbutton = browser.wait(
      :like => [:button, :id, 'submit-button'],
  )
  if @signinbutton
    puts "you are in the registration form"
  end
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

When(/^the user clicks on the account button$/) do
  browser.wait(
      :like => [:a, :id, 'idcta-link'],
  ).click
end

Then /^the log out button should be displayed$/ do
  browser.wait(
      :like => [:a, :class, 'link link--primary primary-nav__link'],
      )
end