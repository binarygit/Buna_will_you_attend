class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "#{current_user.username.capitalize}, You are successfully logged in"
    else
      flash.now[:alert] = 'Email or password is invalid'
      render :new, status: :internal_server_error
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Successfully, logged out!'
  end

  private 

  def form_params 
    params.permit(:email, :password)
  end
end
