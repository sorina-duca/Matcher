class DropMeetings < ActiveRecord::Migration[6.0]
  def up
    drop_table :meetings
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
