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

  it 'allows user to log into their already created account' do
    user = User.create(first_name: "Jordan", last_name: "Meyers", email: "jordanemail", password: "jordanpassword", zipcode: 97213, phone: "1234567", rating: nil, bio: "I specialize in organic gardening practices, and permaculture. I also make a mean chocolate chip cookie", photo: "jordan.jpg")
    visit('/')
    click_link('Login')
    fill_in('email_main', :with => 'jordanemail')
    fill_in('password_main', :with => 'jordanpassword')
    click_button('Login')
    expect(page).to have_content('Hello, Jordan Meyers')
  end

  it 'add a skill' do
    user = User.create(first_name: "Jordan", last_name: "Meyers", email: "jordanemail", password: "jordanpassword", zipcode: 97213, phone: "1234567", rating: nil, bio: "I specialize in organic gardening practices, and permaculture. I also make a mean chocolate chip cookie", photo: "jordan.jpg")
    visit('/')
    click_link('Login')
    fill_in('email_main', :with => 'jordanemail')
    fill_in('password_main', :with => 'jordanpassword')
    click_button('Login')
    click_link('Edit profile')
    fill_in('skill_title', :with => 'fishing')
    fill_in('skill_description', :with => 'I will catch you some really big fish.')
    click_button('Add skill')
    expect(page).to have_content('fishing')
  end

  it "allows user to offer a trade" do
    user = User.create(first_name: "Jordan", last_name: "Meyers", email: "jordanemail", password: "jordanpassword", zipcode: 97213, phone: "1234567", rating: nil, bio: "I specialize in organic gardening practices, and permaculture. I also make a mean chocolate chip cookie", photo: "jordan.jpg")
    user2 = User.create(first_name: "Alissa", last_name: "Jones", email: "alissaemail", password: "alissapassword", zipcode: 97213, phone: "1234567", rating: nil, bio: "I can knit you a custom pair of pants. Let's trade.", photo: "alissa.jpg")
    skill = Skill.create({:user_id => user2.id, :description => "I base jump off of small things, like stools.", :title => "base jumping"})
    tag = Tag.create({:name => "sports"})
    skill.tags.push(tag)
    visit('/')
    click_link('Login')
    fill_in('email_main', :with => 'jordanemail')
    fill_in('password_main', :with => 'jordanpassword')
    click_button('Login')
    click_link('Edit profile')
    fill_in('skill_title', :with => 'fishing')
    fill_in('skill_description', :with => 'I will catch you some really big fish.')
    click_button('Add skill')
    click_link('Barter Bay')
    click_link('sports')
    click_link('base jumping')
    click_button('Propose Trade')
    fill_in('user_password', :with => "jordanpassword")
    click_button('Submit')
    fill_in('trade_terms', :with => "Here are all of my conditions for the trade")
    click_button('Submit trade')
    expect(page).to have_content("Here are all of my conditions for the trade")
  end
end
