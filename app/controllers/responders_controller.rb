class RespondersController < ApplicationController
  def index
    render json: Responder.all, status: :ok
  end

  def create
    responder = Responder.new(responder_params)

    if responder.save
      render json: responder, status: :created
    else
      render_unprocessable(responder.errors)
    end
  end

  private

  def responder_params
    params.require(:responder).permit(:type, :name, :capacity)
  end
end
