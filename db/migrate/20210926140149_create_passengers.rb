class CreatePassengers < ActiveRecord::Migration[6.1]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :email
      t.references :bookings, foreign_key: { to_table: :bookings }
      t.timestamps
    end
  end
end
