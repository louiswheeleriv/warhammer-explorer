# == Schema Information
#
# Table name: unit_model_statlines
#
#  id                 :uuid             not null, primary key
#  unit_model_id      :uuid             not null
#  movement           :integer
#  weapon_skill       :integer
#  ballistic_skill    :integer
#  strength           :integer
#  toughness          :integer
#  wounds             :integer
#  wound_track_bottom :integer
#  wound_track_top    :integer
#  attacks            :integer
#  leadership         :integer
#  armor_save         :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class UnitModelStatline < ApplicationRecord
	belongs_to :unit_model

	FIELDS_REQUIRED_UNLESS_WOUND_TRACK = [
		:movement, :weapon_skill, :ballistic_skill, :strength,
		:toughness, :wounds, :attacks, :leadership, :armor_save
	].freeze

	FIELDS_REQUIRED_UNLESS_WOUND_TRACK.each do |field|
		validates field, presence: true, unless: Proc.new { |stats| stats.wound_track? }
	end

	validate :wound_track_range_validation

	def wound_track?
		!!wound_track_bottom && !!wound_track_top
	end

	private

	def wound_track_range_validation
		if !!wound_track_bottom ^ !!wound_track_top
			errors.add(:base, "If using wound track, both wound_track_bottom and wound_track_top are required.")
		end
	end

end
