class CreateUnits < ActiveRecord::Migration[6.0]
  def change
    create_table :units, id: :uuid do |t|
			t.string :faction, null: false
			t.string :name, null: false
			t.string :detachment_slot, null: false
			t.text :description

			t.timestamps
    end
  end
end
