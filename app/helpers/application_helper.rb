module ApplicationHelper
  def current_user
    session[:customer_id].present? ? Customer.find_by(id: session[:customer_id]) : nil
  end
end
