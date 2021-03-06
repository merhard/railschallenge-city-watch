class EmergencyResponse
  attr_reader :severity, :responder_type

  def initialize(severity, responder_type)
    @severity = severity.to_i
    @responder_type = responder_type
  end

  def responders
    return [] if severity == 0
    return potential_responders if severity >= capacity_total

    most_efficient_response
  end

  def capacity_total
    @capacity_total ||= potential_responders.capacity_total
  end

  private

  def potential_responders
    @potential_responders ||= Responder.ready.type(responder_type).order(capacity: :asc)
  end

  def most_efficient_response
    responders = []
    capacity = 0

    while severity > capacity
      needed_capacity = severity - capacity
      responder = closest_responder_with_enough_capacity(needed_capacity) || responder_pool.pop
      responders << responder
      capacity += responder.capacity
    end

    responders
  end

  def closest_responder_with_enough_capacity(severity)
    responder_pool.detect { |responder| responder.capacity >= severity }
  end

  def responder_pool
    @responder_pool ||= potential_responders.to_a
  end
end
