class CreateTags < ActiveRecord::Migration
  def change
    create_table(:tags) do |t|
      t.column(:name, :string)
    end

    add_column(:users, :photo, :string)
  end
end
