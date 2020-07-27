module Types
  class KeywordType < Types::BaseObject
    field :id, ID, null: false
		field :name, String, null: false

		field :keyword_associations, KeywordAssociationType.connection_type, null: false

		def keyword_associations
			object.keyword_associations
		end

  end
end
