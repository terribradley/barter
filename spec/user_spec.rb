require 'spec_helper'

describe(User) do
  it('validates presence of first name of user') do
    user = User.new({:first_name => ""})
    expect(user.save).to(eq(false))
  end
  it('validates presence of last name of user') do
    user = User.new({:last_name => ""})
    expect(user.save).to(eq(false))
  end
  it('validates presence of email of user') do
    user = User.new({:email => ""})
    expect(user.save).to(eq(false))
  end
  it('validates presence of password of user') do
    user = User.new({:password => ""})
    expect(user.save).to(eq(false))
  end
  it('validates presence of zipcode of user') do
    user = User.new({:zipcode => ""})
    expect(user.save).to(eq(false))
  end
  it('will capitalize first letter of first and last name') do
    user = User.create({:first_name => "bob", :last_name => "smith", :email => "test@gmail.com", :password => "caNaRy45", :zipcode => "12345"})
    expect(user.first_name).to(eq("Bob"))
  end
  it('will capitalize first letter of first and last name') do
    user = User.create({:first_name => "bob", :last_name => "smith", :email => "test@gmail.com", :password => "caNaRy45", :zipcode => "12345"})
    expect(user.last_name).to(eq("Smith"))
  end
  it('will make sure the password is unique') do
    user1 = User.create({:first_name => "bob", :last_name => "smith", :email => "test@gmail.com", :password => "caNaRy45", :zipcode => "12345"})
    user2 = User.new({:first_name => "bob", :last_name => "smith", :email => "test@gmail.com", :password => "caNaRy45", :zipcode => "12345"})
    expect(user2.save).to(eq(false))
  end
  it('will make sure password is at least 8 characters') do
    user = User.new({:first_name => "bob", :last_name => "smith", :email => "test@gmail.com", :password => "caNa", :zipcode => "12345"})
    expect(user.save).to(eq(false))
  end
  it('will make sure zipcode is 5 characters exactly') do
    user = User.new({:first_name => "bob", :last_name => "smith", :email => "test@gmail.com", :password => "caNaRy45", :zipcode => "1234"})
    expect(user.save).to(eq(false))
  end
  it('will make sure that only numbers are in zipcode') do
    user = User.new({:first_name => "bob", :last_name => "smith", :email => "test@gmail.com", :password => "caNaRy45", :zipcode => "1234a"})
    expect(user.save).to(eq(false))
  end
  it('will return skills associated with a user') do
    user = User.create({:first_name => "bob", :last_name => "smith", :email => "test@gmail.com", :password => "caNaRy45", :zipcode => "12345"})
    skill = Skill.create({:description => "kite boarding really fast...so fast", :user_id => user.id })
    expect(user.skills).to(eq([skill]))
  end
  it('will return tags associated with the user') do
    user7 = User.create({:first_name => "bob", :last_name => "smith", :email => "test@gmail.com", :password => "caNaRy45", :zipcode => "12345"})
    skill = Skill.create({:description => "kite boarding really fast...so fast", :user_id => user7.id })
    tag = Tag.create({:name => "sport"})
    skill.tags.push(tag)
    expect(skill.tags).to(eq([tag]))
  end
end
