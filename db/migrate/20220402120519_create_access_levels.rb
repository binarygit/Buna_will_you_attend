class CreateAccessLevels < ActiveRecord::Migration[7.0]
  def change
    create_table :access_levels do |t|
      t.string :name

      t.timestamps
    end
  end
end
