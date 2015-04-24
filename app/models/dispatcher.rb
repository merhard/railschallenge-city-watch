class Dispatcher
  def self.assign_responders(emergency)
    emergency.full_response = true

    Responder::TYPES.each do |responder_type|
      severity = emergency.read_attribute("#{responder_type.downcase}_severity")
      emergency_response = EmergencyResponse.new(severity, responder_type)

      emergency.full_response = false unless emergency_response.full?
      emergency.responders << emergency_response.responders
    end

    emergency.save
  end

  def self.update_response(emergency)
    emergency.responders.clear if emergency.resolved?
  end
end
