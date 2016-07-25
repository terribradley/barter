class CreateSkill < ActiveRecord::Migration
  def change
    create_table(:skills) do |t|
      t.column(:description, :string)
      t.column(:user_id, :integer)
    end
  end
end
