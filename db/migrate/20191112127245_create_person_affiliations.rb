class CreatePersonAffiliations < ActiveRecord::Migration
  def change
    create_table :person_affiliations do |t|
      t.references :person, index: true
      t.references :affiliation, index: true
      t.timestamps null: false
    end
  end
end
