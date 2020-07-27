# == Schema Information
#
# Table name: units
#
#  id              :uuid             not null, primary key
#  faction         :string           not null
#  name            :string           not null
#  detachment_slot :string           not null
#  description     :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Unit < ApplicationRecord
	has_many :unit_models, dependent: :destroy
	has_many :keyword_associations, dependent: :destroy
	has_many :keywords, through: :keyword_associations

	DETACHMENT_SLOTS = [
		'hq', 'troop', 'elite', 'heavy_support',
		'fast_attack', 'flyer', 'transport', 'lord_of_war'
	].freeze

	validates :detachment_slot, inclusion: { in: DETACHMENT_SLOTS }
end
