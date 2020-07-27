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
end
