module Types
  class UnitModelStatlineType < Types::BaseObject
    field :id, ID, null: false
		field :unit_model_id, ID, null: false

		field :movement, Int, null: true
		field :weapon_skill, Int, null: true
		field :ballistic_skill, Int, null: true
		field :strength, Int, null: true
		field :toughness, Int, null: true
		field :wounds, Int, null: true
		field :wound_track_bottom, Int, null: true
		field :wound_track_top, Int, null: true
		field :attacks, Int, null: true
		field :leadership, Int, null: true
		field :armor_save, Int, null: true

  end
end
