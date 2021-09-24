class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.datetime :departure_time
      t.string :duration
      t.references :to_airport, foreign_key: {to_table: :airports}
      t.references :from_airport, foreign_key: {to_table: :airports}
      t.timestamps
    end
  end
end
