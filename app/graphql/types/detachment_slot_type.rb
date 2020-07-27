module Types
  class DetachmentSlotType < Types::BaseEnum
    Unit::DETACHMENT_SLOTS.each do |detachment_slot|
			value detachment_slot.underscore.upcase, detachment_slot.titleize, value: detachment_slot
		end
  end
end
