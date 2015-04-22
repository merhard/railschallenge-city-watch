class EmergenciesController < ApplicationController
  def create
    emergency = Emergency.new(create_emergency_params)

    if emergency.save
      render_created(emergency)
    else
      render_unprocessable(emergency.errors)
    end
  end

  private

  def create_emergency_params
    params.require(:emergency).permit(:code, :fire_severity, :police_severity, :medical_severity)
  end
end
