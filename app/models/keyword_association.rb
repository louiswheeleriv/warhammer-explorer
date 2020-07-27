# == Schema Information
#
# Table name: keyword_associations
#
#  id            :uuid             not null, primary key
#  keyword_id    :uuid             not null
#  unit_id       :uuid
#  unit_model_id :uuid
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class KeywordAssociation < ApplicationRecord
	belongs_to :keyword
	belongs_to :unit, optional: true
	belongs_to :unit_model, optional: true

	validate :exactly_one_association

	LIMITED_ASSOCIATION_FIELDS = [:unit_id, :unit_model_id]

	private

	def exactly_one_association
		associations = LIMITED_ASSOCIATION_FIELDS.map(&method(:public_send)).compact
		unless associations.length == 1
			errors.add(:base, "KeywordAssociation must be related to exactly one of #{LIMITED_ASSOCIATION_FIELDS}")
		end
	end
end
