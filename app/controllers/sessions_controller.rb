class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    
    if user && user.authenticate(params[:session][:password])
      #login user and redirecto user's show page
      flash[:success] = "Welcome back #{user[:name]}!"
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'  #not quite right!
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
