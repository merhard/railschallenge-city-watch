class ApplicationController < ActionController::Base
  rescue_from ActionController::UnpermittedParameters do |exception|
    render_unprocessable(exception.message)
  end

  private

  def render_ok(object)
    render_json(object, :ok)
  end

  def render_created(object)
    render_json(object, :created)
  end

  def render_unprocessable(message)
    object = message_with_root_element(message)

    render_json(object, :unprocessable_entity)
  end

  def render_not_found
    object = message_with_root_element('page not found')

    render_json(object, :not_found)
  end

  def render_json(object, status)
    render json: object, status: status
  end

  def message_with_root_element(message)
    { message: message }
  end
end
