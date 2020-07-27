module Types
  class KeywordAssociationType < Types::BaseObject
    field :id, ID, null: false
		field :keyword_id, ID, null: false
		field :unit_id, ID, null: true
		field :unit_model_id, ID, null: true
  end
end
