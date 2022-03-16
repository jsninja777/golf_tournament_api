class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.boolean :handicap, default: false
      t.string :location

      t.timestamps
    end
  end
end
