class ApplicationController < ActionController::Base
  def loggedin_checkker
    redirect_to root_path and return if current_customer.present?
  end

  private

  def current_customer
    Customer.find_by(id: session[:customer_id]) if session[:customer_id].present?
  end
end
