require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require('pry')

# HOME
get '/' do
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
  erb(:user)
end

# USER PROFILE EDIT
get('/users/:id/edit') do
  @user = User.find(params.fetch('id').to_i)
  erb(:user_edit)
end

# UPDATE BIO
patch('/users/edit/bio') do
  user = User.find(params.fetch('user_id').to_i)
  bio = params.fetch('bio')
  user.update({:bio => bio})
  redirect("/users/#{user.id}/edit")
end

# LOGIN
post('/users/login') do
  password = params.fetch('password')
  @user = User.find_by({:password => password})
  if @user.first_name == "Admin"
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


# CLEAR OUT DATABASE
get('/clear') do
  User.all.each do |user|
    user.destroy
  end
  redirect("/")
end
