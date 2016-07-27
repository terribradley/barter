require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require('pry')

# HOME
get '/' do
  @tags = Tag.all
  erb(:index)
end

# NEW USER FORM
get('/users/new') do
  erb(:user_form)
end

# USER CREATE
post('/users/new') do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  email = params.fetch('email')
  password = params.fetch('password')
  zipcode = params.fetch('zipcode')
  @user = User.new({:first_name => first_name, :last_name => last_name, :email => email, :password => password, :zipcode => zipcode})
  if @user.save
    redirect("/users/#{@user.id}")
  else
    erb(:user_form)
  end
end

# USER PROFILE
get('/users/:id') do
  @user = User.find(params.fetch('id').to_i)
  @tags = Tag.all
  erb(:user)
end

# USER PROFILE EDIT
get('/users/:id/edit') do
  @user = User.find(params.fetch('id').to_i)
  @tags = Tag.all
  erb(:user_edit)
end

# USER UPDATE BIO
patch('/users/edit/bio') do
  user = User.find(params.fetch('user_id').to_i)
  bio = params.fetch('bio')
  user.update({:bio => bio})
  redirect("/users/#{user.id}/edit")
end

# USER UPDATE TAGS WANT
patch('/users/edit/tags/want') do
  tag = Tag.find(params.fetch('tag_want').to_i)
  user = User.find(params.fetch('user_id').to_i)
  user.tags.push(tag)
  redirect("/users/#{user.id}/edit")
end

# USER UPDATE TAGS HAVE
  patch('/skills/tags/new') do
  skill = Skill.find(params.fetch('skill_tag'))
  user = User.find(params.fetch('user_id').to_i)
  new_tags = params.fetch('tag_id')
  tags = []
  new_tags.each do | tag |
    tags.push(Tag.find(tag.to_i))
  end
  tags.each do |tag|
    skill.tags.push(tag)
  end
  redirect("/users/#{user.id}/edit")
end


# SKILL ADD
post('/skills/add') do
  user_id = params.fetch('user_id').to_i
  user = User.find(user_id)
  description = params.fetch('skill_description')
  title = params.fetch("skill_title")
  Skill.create({:description => description, :user_id => user_id, :title => title})
  redirect("/users/#{user.id}/edit")
end

#SKILL DELETE
delete('/skills/delete') do
  skill = Skill.find(params.fetch('skill_delete'))
  skill.destroy
  user = User.find(params.fetch('user_id').to_i)
  redirect("/users/#{user.id}/edit")
end

#USER DELETE TAGS WANT
delete('/users/delete/tags/want') do
  user = User.find(params.fetch('user_id').to_i)
  tag = Tag.find(params.fetch('tag_want_delete').to_i)
  user.tags.destroy(tag)
  redirect("/users/#{user.id}/edit")
end

# LOGIN
post('/users/login') do
  password = params.fetch('password')
  @user = User.find_by({:password => password})
  if @user.nil?
    erb(:no_account)
  elsif @user.first_name == "Admin"
    redirect("/admin")
  else
    redirect("/users/#{@user.id}")
  end
end

# ADMIN
get('/admin') do
  @tags = Tag.all
  @users = User.all
  erb(:admin)
end

# ADMIN TAGS ADD
post('/tags/new') do
  name = params.fetch('tag')
  Tag.create({:name => name})
  redirect("/admin")
end

#ADMIN TAGS DELETE
delete('/tags/delete') do
  tag = Tag.find(params.fetch('tag_id').to_i)
  tag.destroy
  redirect("/admin")
end

#ADMIN USER DELETE
delete('/users/delete') do
  user = User.find(params.fetch('user_id').to_i)
  user.destroy
  redirect("/admin")
end

# SEE SKILL PAGE
get('/tags/:id') do
  @tag = Tag.find(params.fetch('id').to_i)
  @skills = @tag.skills
  erb(:skill)
end

#SEE PROFILE PAGE
get('/user/profile/:id') do
  @user = User.find(params.fetch('id').to_i)
  erb(:user_profile)
end

# USER PROPOSE TRADE
get('/trades/new') do

end


# CLEAR OUT DATABASE
get('/clear') do
  User.all.each do |user|
    user.destroy
  end
  Tag.all.each do |tag|
    tag.destroy
  end
  Skill.all.each do |skill|
    skill.destroy
  end
  redirect("/")
end
