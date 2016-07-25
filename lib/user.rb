class User < ActiveRecord::Base
  has_many :skills
  has_many :tags, through: :skills

  validates(:first_name, {:presence => true})
  validates(:last_name, {:presence => true})
  validates(:email, {:presence => true})
  validates(:password, {:presence => true, uniqueness: true, :length => {minimum: 8}})
  validates(:zipcode, {:presence => true, length: {is: 5}, numericality: {only_integer: true}})
  before_save(:capitalize_name)

  private
  define_method(:capitalize_name) do
    self.first_name = first_name.capitalize
    self.last_name = last_name.capitalize
  end
end
