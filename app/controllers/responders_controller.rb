class RespondersController < ApplicationController
  def index
    render_ok(Responder.all)
  end

  def show
    responder = Responder.find_by(name: params[:name])

    if responder
      render_ok(responder)
    else
      render json: { message: 'page not found' }, status: :not_found
    end
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
