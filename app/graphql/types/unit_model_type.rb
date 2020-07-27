module Types
  class UnitModelType < Types::BaseObject
    field :id, ID, null: false
		field :unit_id, ID, null: false
		field :name, String, null: false

		field :unit_model_statlines, UnitModelStatlineType.connection_type, null: false
		field :keywords, KeywordType.connection_type, null: false
		field :images, ImageType.connection_type, null: false

		def unit_model_statlines
			object.unit_model_statlines
		end

		def keywords
			object.keywords
		end

		def images
			object.images
		end

  end
end
