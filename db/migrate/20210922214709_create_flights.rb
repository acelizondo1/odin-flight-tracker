class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.datetime :departure_time
      t.string :duration
      t.references :destination_airport, foreign_key: {to_table: :airports}
      t.references :arrival_airport, foreign_key: {to_table: :airports}
      t.timestamps
    end
  end
end
