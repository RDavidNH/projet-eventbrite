class UsersController < ApplicationController

  def show
    p current_user

    @user = User.find(params[:id])
    @user_events = @user.created_events
  end

end
