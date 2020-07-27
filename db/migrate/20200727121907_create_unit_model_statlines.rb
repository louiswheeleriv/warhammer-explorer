class CreateUnitModelStatlines < ActiveRecord::Migration[6.0]
  def change
    create_table :unit_model_statlines, id: :uuid do |t|
			t.uuid :unit_model_id, null: false
			t.integer :movement
			t.integer :weapon_skill
			t.integer :ballistic_skill
			t.integer :strength
			t.integer :toughness
			t.integer :wounds
			t.integer :wound_track_bottom
			t.integer :wound_track_top
			t.integer :attacks
			t.integer :leadership
			t.integer :armor_save

			t.timestamps
    end

		add_index :unit_model_statlines, :unit_model_id
  end
end
