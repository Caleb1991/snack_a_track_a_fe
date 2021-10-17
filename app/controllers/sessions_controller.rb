class SessionsController < ApplicationController
  def create
    user_parameters = {
      username: params[:username],
      password: params[:password]
    }

    user = UserFacade.log_in_user(user_parameters)

    if user[:logged_in]
      session[:user_id] = user[:id]
      redirect_to "/users/#{user[:id]}"
    else
      redirect_to '/welcome'
      flash.alert = 'Username or password is incorrect.'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/welcome'
  end
end
