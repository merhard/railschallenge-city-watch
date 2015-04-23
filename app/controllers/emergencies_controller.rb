class EmergenciesController < ApplicationController
  before_action :set_emergency, only: [:show, :update]

  def index
    render_ok(Emergency.all)
  end

  def show
    if @emergency
      render_ok(@emergency)
    else
      render_not_found
    end
  end

  def create
    emergency = Emergency.new(create_emergency_params)

    if emergency.save
      Dispatcher.assign_responders(emergency)
      render_created(emergency)
    else
      render_unprocessable(emergency.errors)
    end
  end

  def update
    if @emergency.try(:update, update_emergency_params)
      render_ok(@emergency)
    else
      render_unprocessable(@emergency.errors)
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

  def set_emergency
    @emergency = Emergency.find_by(code: params[:code])
  end

  def create_emergency_params
    params.require(:emergency).permit(:code, :fire_severity, :police_severity, :medical_severity)
  end

  def update_emergency_params
    params.require(:emergency).permit(:fire_severity, :police_severity, :medical_severity, :resolved_at)
  end
end
