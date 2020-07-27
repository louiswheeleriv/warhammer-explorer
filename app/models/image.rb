# == Schema Information
#
# Table name: images
#
#  id          :uuid             not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Image < ApplicationRecord
	has_many :image_associations, dependent: :destroy
	has_many :units, through: :image_associations
	has_many :unit_models, through: :image_associations

	# TODO
	def image_url
		file_path
	end

	def file_path
		File.join(Rails.configuration.image_storage_path, name)
	end

end
