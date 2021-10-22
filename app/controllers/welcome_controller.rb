class WelcomeController < ApplicationController
  def index
    if session[:user_id] != nil
      redirect_to "/users/#{session[:user_id]}"
    end
  end
end
# test
