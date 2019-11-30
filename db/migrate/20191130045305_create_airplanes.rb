class CreateAirplanes < ActiveRecord::Migration[6.0]
  def change
    create_table :airplanes do |t|
      t.string :name
      t.integer :rows
      t.integer :columns

      t.timestamps
    end
  end
end
