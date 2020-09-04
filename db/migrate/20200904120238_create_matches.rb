class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.integer :user_1_id
      t.integer :user_2_id
      t.datetime :start
      t.datetime :end
      t.string :joint_interests

      t.timestamps
    end
  end
end
