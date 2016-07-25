class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.column(:first_name, :string)
      t.column(:last_name, :string)
      t.column(:email, :string)
      t.column(:password, :string)
      t.column(:zipcode, :integer)
      t.column(:phone, :string)
      t.column(:rating, :integer)
      t.column(:bio, :text)
    end
  end
end
