class CreatePersonLocations < ActiveRecord::Migration
  def change
    create_table :person_locations do |t|
      t.references :person, index: true
      t.references :location, index: true
      t.timestamps null: false
    end
  end
end
