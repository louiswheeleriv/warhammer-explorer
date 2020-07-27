# == Schema Information
#
# Table name: keywords
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Keyword < ApplicationRecord
	has_many :keyword_associations, dependent: :destroy
	has_many :units, through: :keyword_associations
	has_many :unit_models, through: :keyword_associations
end
