module Types
  class DetachmentSlotType < Types::BaseEnum
    Unit::DETACHMENT_SLOTS.each do |detachment_slot|
			value detachment_slot.underscore.upcase, detachment_slot.titleize
		end
  end
end
