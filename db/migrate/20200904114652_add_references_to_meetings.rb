class AddReferencesToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :user_1_id, :integer
    add_column :meetings, :user_2_id, :integer
  end
end

