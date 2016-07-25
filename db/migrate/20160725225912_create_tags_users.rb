class CreateTagsUsers < ActiveRecord::Migration
  def change
    create_table(:tags_users) do |t|
      t.column(:tag_id, :integer)
      t.column(:user_id, :integer)
    end
  end
end
