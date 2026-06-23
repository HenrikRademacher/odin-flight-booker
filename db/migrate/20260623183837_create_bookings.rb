class CreateBookings < ActiveRecord::Migration[8.1]
  def change
    create_table :bookings do |t|
      t.timestamps
      t.belongs_to :flight
    end
  end
end
