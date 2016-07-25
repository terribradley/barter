class CreateSkillsTags < ActiveRecord::Migration
  def change
    create_table(:skills_tags) do |t|
      t.column(:skill_id, :integer)
      t.column(:tag_id, :integer)
    end
  end
end
