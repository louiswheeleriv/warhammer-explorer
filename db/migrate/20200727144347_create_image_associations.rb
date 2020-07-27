class CreateImageAssociations < ActiveRecord::Migration[6.0]
  def change
    create_table :image_associations, id: :uuid do |t|
			t.uuid :image_id, null: false
			t.uuid :unit_id
			t.uuid :unit_model_id

			t.timestamps
    end

		add_index :image_associations, :image_id
		add_index :image_associations, :unit_id
		add_index :image_associations, :unit_model_id
  end
end
