class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.string :flight_number
      t.string :origin
      t.string :destination
      t.string :date
      t.references :airplane, null: false, foreign_key: true

      t.timestamps
    end
  end
end
