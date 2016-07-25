ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)
set(:root, Dir.pwd())

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.after(:each) do
    User.all().each() do |user|
      user.destroy()
    end
    Skill.all().each() do |skill|
      skill.destroy()
    end
    Tag.all().each() do |tag|
      tag.destroy()
    end
  end
end
