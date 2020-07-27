class CreateKeywordAssociations < ActiveRecord::Migration[6.0]
  def change
    create_table :keyword_associations, id: :uuid do |t|
			t.uuid :keyword_id, null: false
			t.uuid :unit_id
			t.uuid :unit_model_id

			t.timestamps
    end

		add_index :keyword_associations, :keyword_id
		add_index :keyword_associations, :unit_id
		add_index :keyword_associations, :unit_model_id
  end
end
