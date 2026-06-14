class CreateAirports < ActiveRecord::Migration[8.1]
  def change
    create_table :airports do |t|
      t.timestamps
      t.string :code
      t.string :name
    end
  end
end
