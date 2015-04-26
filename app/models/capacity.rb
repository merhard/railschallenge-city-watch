class Capacity
  include ActiveModel::SerializerSupport

  attr_reader :responders

  def initialize(responders = Responder.all)
    @responders = responders
  end

  Responder::TYPES.each do |type|
    define_method(type) do
      [
        responders.type(type).capacity_total,
        responders.available.type(type).capacity_total,
        responders.on_duty.type(type).capacity_total,
        responders.ready.type(type).capacity_total
      ]
    end
  end
end
