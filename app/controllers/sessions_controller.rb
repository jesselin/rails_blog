class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
  	user = User.authenticate(params[:session][:email_address], params[:session][:password])

  	if user.nil?
  		flash.now[:error] = "Invalid email/password combination."
  		render :new
  	else
  		sign_in user
  		redirect_to users_path
  		# redirect_to user
  	end

  end

  def destroy
  	sign_out
  	redirect_to signin_path
  end

end
