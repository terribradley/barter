require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  erb(:index)
end

get('/user/new') do
  erb(:user_form)
end

post('/user/new') do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  email = params.fetch('email')
  password = params.fetch('password')
  zipcode = params.fetch('zipcode')
  @user = User.new({:first_name => first_name, :last_name => last_name, :email => email, :password => password, :zipcode => zipcode})
  if @user.save
    redirect("/user/#{@user.id}")
  else
    erb(:user_errors)
  end
end

get('/user/:id') do
  @user = User.find(params.fetch('id').to_i)
  erb(:user)
end

get('/user/:id/edit') do
  @user = User.find(params.fetch('id').to_i)
  erb(:user_edit)
end

patch('/user/edit/bio') do
  user = User.find(params.fetch('user_id').to_i)
  bio = params.fetch('bio')
  user.update({:bio => bio})
  redirect("/user/#{user.id}/edit")
end
