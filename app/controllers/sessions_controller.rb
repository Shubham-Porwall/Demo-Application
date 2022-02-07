class SessionsController < ApplicationController
  before_action :is_loggedin, only: [:new, :create]
  def new
  end

  def create
    @customer = Customer.find_by(email: params[:email])
    if @customer.present? && @customer.authenticate(params[:password])
      session[:customer_id] = @customer.id
      flash[:log_in] = "Successfully login"
      redirect_to root_path
    else
      flash[:alert] = "Invalid Id or passowrd"
      redirect_to sessions_new_path
    end
  end

  def destroy
    session[:customer_id] = nil
    flash[:log_out] = "Logged out successfully"
    redirect_to root_path
  end
end
