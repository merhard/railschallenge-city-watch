class RespondersController < ApplicationController
  before_action :set_responder, only: [:show, :update]

  def index
    render_ok(Responder.all)
  end

  def show
    if @responder
      render_ok(@responder)
    else
      render_not_found
    end
  end

  def create
    responder = Responder.new(create_responder_params)

    if responder.save
      render_created(responder)
    else
      render_unprocessable(responder.errors)
    end
  end

  def update
    if @responder.try(:update, update_responder_params)
      render_ok(@responder)
    else
      render_unprocessable(@responder.errors)
    end
  end

  def new
    render_not_found
  end

  def edit
    render_not_found
  end

  def destroy
    render_not_found
  end

  private

  def set_responder
    @responder = Responder.find_by(name: params[:name])
  end

  def create_responder_params
    params.require(:responder).permit(:type, :name, :capacity)
  end

  def update_responder_params
    params.require(:responder).permit(:on_duty)
  end
end
