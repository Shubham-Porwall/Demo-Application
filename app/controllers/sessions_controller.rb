class SessionsController < ApplicationController
  before_action :loggedin_checkker, only: %i(new create)
  
  def new; end

  def create
    @customer = Customer.find_by(email: params[:email])
    if @customer.present? && @customer.authenticate(params[:password])
      session[:customer_id] = @customer.id
      flash[:success] = "Successfully login"
      redirect_to root_path
    else
      flash[:error] = "Invalid Id or passowrd"
      redirect_to sessions_url
    end
  end

  def destroy
    session[:customer_id] = nil
    flash[:alert] = "Logged out successfully"
    redirect_to root_path
  end
end
