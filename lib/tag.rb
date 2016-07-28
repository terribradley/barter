class Tag < ActiveRecord::Base
  has_and_belongs_to_many(:skills)
  has_and_belongs_to_many(:users)

  validates(:name, {:presence => true, uniqueness: true})

end
