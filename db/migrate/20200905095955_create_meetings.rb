class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.datetime :start
      t.datetime :end
      t.references :requester, null: false, foreign_key: { to_table: :users }
      t.references :accepter, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
