class CreateUnitModels < ActiveRecord::Migration[6.0]
  def change
    create_table :unit_models, id: :uuid do |t|
			t.uuid :unit_id, null: false
			t.string :name, null: false

			t.timestamps
    end

		add_index :unit_models, :unit_id
  end
end
