require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')

describe('create an account', {:type => :feature}) do
  it "allows users to create a new account" do
    visit '/'
    click_link 'Create account'
    fill_in('first_name', :with => "Brett")
    fill_in('last_name', :with => "New")
    fill_in('email', :with => "test@gmail.com")
    fill_in('password', :with => "$%^k2Hi!")
    fill_in('zipcode', :with => "12345")
    click_button('Create Account')
    expect(page).to have_content('Brett')
  end
end
