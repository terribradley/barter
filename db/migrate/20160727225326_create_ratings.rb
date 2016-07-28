class CreateRatings < ActiveRecord::Migration
  def change
    create_table(:ratings) do |t|
      t.column(:rating, :integer)
    end
    create_table(:ratings_users) do |t|
      t.column(:user_id, :integer)
      t.column(:rating_id, :integer)
    end
  end
end
