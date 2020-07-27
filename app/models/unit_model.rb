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

end
