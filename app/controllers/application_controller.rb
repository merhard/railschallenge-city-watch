class ApplicationController < ActionController::Base
  rescue_from ActionController::UnpermittedParameters do |exception|
    render_unprocessable(exception.message)
  end

  private

  def render_ok(object, options = {})
    render_json(object, :ok, options)
  end

  def render_created(object, options = {})
    render_json(object, :created, options)
  end

  def render_unprocessable(message, options = {})
    object = message_with_root_element(message)

    render_json(object, :unprocessable_entity, options)
  end

  def render_not_found(options = {})
    object = message_with_root_element('page not found')

    render_json(object, :not_found, options)
  end

  def render_json(object, status, options = {})
    render({ json: object, status: status }.merge(options))
  end

  def message_with_root_element(message)
    { message: message }
  end
end
