class Capacity
  include ActiveModel::SerializerSupport

  attr_reader :responders

  def initialize(responders = Responder.all)
    @responders = responders
  end

  %w(Fire Police Medical).each do |type|
    define_method(type) do
      [
        capacity_total_of_type(type),
        available_capacity_total_of_type(type),
        on_duty_capacity_total_of_type(type),
        ready_capacity_total_of_type(type)
      ]
    end
  end

  private

  def capacity_total_of_type(type)
    responders.capacity_total_of_type(type)
  end

  def available_capacity_total_of_type(type)
    responders.available_capacity_total_of_type(type)
  end

  def on_duty_capacity_total_of_type(type)
    responders.on_duty_capacity_total_of_type(type)
  end

  def ready_capacity_total_of_type(type)
    responders.ready_capacity_total_of_type(type)
  end
end
