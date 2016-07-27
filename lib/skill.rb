class Skill < ActiveRecord::Base
  has_and_belongs_to_many(:tags)
  has_and_belongs_to_many(:trades)
  belongs_to(:user)

  validates(:description, {:presence => true, :length => {minimum: 20}})

end
