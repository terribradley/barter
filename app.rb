require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  erb(:index)
end

get('/users/new') do
  erb(:user_form)
end

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

get('/users/:id') do
  @user = User.find(params.fetch('id').to_i)
  erb(:user)
end

get('/users/:id/edit') do
  @user = User.find(params.fetch('id').to_i)
  erb(:user_edit)
end

patch('/users/edit/bio') do
  user = User.find(params.fetch('user_id').to_i)
  bio = params.fetch('bio')
  user.update({:bio => bio})
  redirect("/users/#{user.id}/edit")
end

post('/users/login') do
  password = params.fetch('password')
  @user = User.find_by({:password => password})
  redirect("/users/#{@user.id}")
end
