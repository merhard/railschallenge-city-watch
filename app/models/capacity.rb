class Capacity
  include ActiveModel::SerializerSupport

  attr_reader :responders

  def initialize(responders = Responder.all)
    @responders = responders
  end

  delegate :capacity_total_of_type, :available_capacity_total_of_type,
           :on_duty_capacity_total_of_type, :ready_capacity_total_of_type,
           to: :responders

  Responder::TYPES.each do |type|
    define_method(type) do
      [
        capacity_total_of_type(type),
        available_capacity_total_of_type(type),
        on_duty_capacity_total_of_type(type),
        ready_capacity_total_of_type(type)
      ]
    end
  end
end
