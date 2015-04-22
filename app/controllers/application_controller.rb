class ApplicationController < ActionController::Base
  rescue_from ActionController::UnpermittedParameters do |exception|
    render_unprocessable(exception.message)
  end

  private

  def render_ok(object)
    render json: object, status: :ok
  end

  def render_unprocessable(message)
    render json: { message: message }, status: :unprocessable_entity
  end
end
