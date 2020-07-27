# == Schema Information
#
# Table name: image_associations
#
#  id            :uuid             not null, primary key
#  image_id      :uuid             not null
#  unit_id       :uuid
#  unit_model_id :uuid
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class ImageAssociation < ApplicationRecord
	belongs_to :image
	belongs_to :unit, optional: true
	belongs_to :unit_model, optional: true

	validate :exactly_one_association

	LIMITED_ASSOCIATION_FIELDS = [:unit_id, :unit_model_id].freeze

	private

	def exactly_one_association
		associations = LIMITED_ASSOCIATION_FIELDS.map(&method(:public_send)).compact
		unless associations.length == 1
			errors.add(:base, "ImageAssociation must be associated to exactly one of #{LIMITED_ASSOCIATION_FIELDS}")
		end
	end

end
