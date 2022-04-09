class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'You are successfully logged in'
    else
      flash.now[:alert] = 'Email or password is invalid'
      render :new
    end
  end

  def destroy
  end

  private 

  def form_params 
    params.permit(:email, :password)
  end
end
