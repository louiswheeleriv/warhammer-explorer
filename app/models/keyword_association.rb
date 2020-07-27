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
	belongs_to :unit
	belongs_to :unit_model
end
