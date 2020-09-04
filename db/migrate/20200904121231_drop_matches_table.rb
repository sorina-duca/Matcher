class DropMatchesTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :matches
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
