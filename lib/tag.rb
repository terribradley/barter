class Tag < ActiveRecord::Base
  has_and_belongs_to_many(:skills)
  has_many :users, through: :skills

end
