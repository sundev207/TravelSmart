class Api::SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    # debugger
    if @user
      login_user!(@user)
      render "api/users/show"
    else
      render(
        json: ["Sorry!, invalid username/password combination"],
        status: 401
      )
    end
  end

  def destroy
    @user = current_user
    if @user
      logout_user!
      render "api/users/show"
    else
      render(
        json: ["Nobody signed in"],
        status: 404
      )
    end
  end
end