include ApplicationHelper

def sign_in(user)
  visit signin_path
  fill_in 'Email', with: user.email.upcase
  fill_in 'Password', with: user.password
  click_button 'Sign in'
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end

def sign_out
  click_link 'Sign out'
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('.alert.alert-error', text: message)
  end
end
