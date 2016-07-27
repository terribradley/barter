class CreateTrades < ActiveRecord::Migration
  def change
    create_table(:trades) do |t|
      t.column(:terms, :text)
      t.column(:deadline, :date)
      t.column(:agree, :boolean)
    end
    create_table(:skills_trades) do |t|
      t.column(:skill_id, :integer)
      t.column(:trade_id, :integer)
    end
  end
end
