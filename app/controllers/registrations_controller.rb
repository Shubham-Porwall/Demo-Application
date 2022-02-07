class RegistrationsController < ApplicationController
  before_action :is_loggedin, only: [:new, :create]
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(signup_params)
    if @customer.save
      flash[:notice] = "successfully submitted"
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
