require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')

describe('user experience', {:type => :feature}) do
  it "allows users to create a new account" do
    visit '/'
    click_link 'Sign up'
    fill_in('first_name', :with => "John")
    fill_in('last_name', :with => "Smith")
    fill_in('email_form', :with => "johnemail")
    fill_in('password_form', :with => "johnpassword")
    fill_in('zipcode', :with => "12345")
    click_button('Create Account')
    expect(page).to have_content('John')
  end

  it 'alllows user to log into their already created account' do
    user = User.create(first_name: "Jordan", last_name: "Meyers", email: "jordanemail", password: "jordanpassword", zipcode: 97213, phone: "1234567", rating: nil, bio: "I specialize in organic gardening practices, and permaculture. I also make a mean chocolate chip cookie", photo: "jordan.jpg")
    visit('/')
    click_link('Login')
    fill_in('email_main', :with => 'jordanemail')
    fill_in('password_main', :with => 'jordanpassword')
    click_button('Login')
    expect(page).to have_content('Hello, Jordan Meyers')
  end
end
