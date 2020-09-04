class AddUserReferenceToAvailabilities < ActiveRecord::Migration[6.0]
  def change
    add_reference :availabilities, :user, null: false, foreign_key: true
  end
end
