class UsersController < ApplicationController
  def new
  end

  def create
    user_parameters = {
      username: params[:username],
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    }

    @user = UserFacade.register_user(user_parameters)

    if @user.class == User
      redirect_to "/users/#{@user.id}"
    else
      redirect_to '/users/new'
      flash.alert = @user
    end
  end

  def show
    @user = UserFacade.create_single_user_object(params[:id])
    @top_snacks = UserFacade.top_snacks(params[:id])
  end
end
