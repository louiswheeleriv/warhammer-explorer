module Types
  class UnitType < Types::BaseObject
    field :id, ID, null: false
		field :faction, String, null: false
		field :name, String, null: false
		field :detachment_slot, DetachmentSlotType, null: false
		field :description, String, null: true

		field :unit_models, UnitModelType.connection_type, null: false
		field :keywords, KeywordType.connection_type, null: false
		field :images, ImageType.connection_type, null: false

		def unit_models
			object.unit_models
		end

		def keywords
			object.keywords
		end

		def images
			object.images
		end

  end
end
