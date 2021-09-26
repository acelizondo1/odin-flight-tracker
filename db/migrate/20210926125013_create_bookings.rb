class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :flights, foreign_key: { to_table: :flights }

      t.timestamps
    end
  end
end
