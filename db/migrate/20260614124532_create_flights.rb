class CreateFlights < ActiveRecord::Migration[8.1]
  def change
    create_table :flights do |t|
      t.timestamps
      t.datetime :departure
      t.time :duration
      t.belongs_to :departure_airport
      t.belongs_to :arrival_airport
    end
  end
end
