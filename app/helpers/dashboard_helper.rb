module DashboardHelper
  def alert_type(type)
    case type
    when 'notice'
      'success'
    when 'error'
      'danger'
    else
      type
    end
  end

  def current_page?(controller, action)
    params[:controller] == controller.to_s && params[:action] == action.to_s
  end

  def current_controller?(controller)
    params[:controller] == controller.to_s
  end
end
