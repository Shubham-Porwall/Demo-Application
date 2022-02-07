module ApplicationHelper
  def current_user
    session[:customer_id].present? ? Customer.find_by(id: session[:customer_id]) : nil
  end

  def flash_class(level)
    case level
        when "notice" then "info"
        when "success" then "success"
        when "error" then "danger"
        when "alert" then "danger"
    end
  end
end
