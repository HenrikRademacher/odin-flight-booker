class CreatePassengers < ActiveRecord::Migration[8.1]
  def change
    create_table :passengers do |t|
      t.timestamps
      t.belongs_to :booking
      t.string :name
      t.string :email
    end
  end
end
