class AddAccessLevelRefToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :access_level, null: false, foreign_key: true
  end
end
