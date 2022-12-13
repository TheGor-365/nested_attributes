class CreateItineraries < ActiveRecord::Migration[7.0]
  def change
    create_table :itineraries do |t|
      t.string :village
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
