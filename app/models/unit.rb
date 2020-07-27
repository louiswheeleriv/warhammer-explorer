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

end
