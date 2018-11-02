class CreateLizards < ActiveRecord::Migration[5.1]
  def change
    create_table :lizards do |t|
      t.string :name
      t.integer :age
      t.integer :level
      t.integer :armor

      t.timestamps
    end
  end
end
