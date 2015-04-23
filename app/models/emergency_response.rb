class EmergencyResponse
  attr_reader :severity, :responder_type

  def initialize(severity, responder_type)
    @severity = severity.to_i
    @responder_type = responder_type
  end

  def full?
    capacity_total >= severity
  end

  def responders
    []
  end

  private

  def capacity_total
    @capacity_total ||= potential_responders.capacity_total
  end

  def potential_responders
    @potential_responders ||= Responder.ready.type(responder_type)
  end
end
