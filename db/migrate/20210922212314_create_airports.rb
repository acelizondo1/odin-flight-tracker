class CreateAirports < ActiveRecord::Migration[6.1]
  def change
    create_table :airports do |t|
      t.string :city
      t.string :state
      t.string :airport_code
      t.timestamps
    end
  end
end
