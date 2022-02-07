class ApplicationController < ActionController::Base
  def is_loggedin
    if current_user.present?
      redirect_to root_path
      return
    end
  end

  def current_user
    session[:customer_id].present? ? Customer.find_by(id: session[:customer_id]) : nil
  end
end
