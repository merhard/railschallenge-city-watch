class RespondersController < ApplicationController
  def create
    responder = Responder.new(responder_params)
    responder.save

    render json: responder, status: :created
  end

  private

  def responder_params
    params.require(:responder).permit(:type, :name, :capacity)
  end
end
