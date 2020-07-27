module Types
  class ImageType < Types::BaseObject
    field :id, ID, null: false
		field :name, String, null: true
		field :description, String, null: true
		field :image_url, String, null: false

		def image_url
			object.image_url
		end

  end
end
