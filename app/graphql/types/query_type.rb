module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

		field :unit, UnitType, null: true do
			argument :id, ID, required: true
		end

		field :units, UnitType.connection_type, null: false

		def unit(id:)
			Unit.find(id)
		end

		def units
			Unit.all
		end

  end
end
