class RegistrationsController < ApplicationController
  before_action :loggedin_checkker, only: %i(:new, :create)
  
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(signup_params)
    if @customer.save
      flash[:notice] = "Successfully signed up."
      redirect_to root_path 
    else
      render 'new'
    end
  end

  private 
  
  def signup_params
    params.permit(:email, :password, :password_confirmation)
  end
end
