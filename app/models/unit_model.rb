# == Schema Information
#
# Table name: unit_models
#
#  id         :uuid             not null, primary key
#  unit_id    :uuid             not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UnitModel < ApplicationRecord
	belongs_to :unit
	has_many :unit_model_statlines, dependent: :destroy
	has_many :keyword_associations, dependent: :destroy
	has_many :keywords, through: :keyword_associations
end
