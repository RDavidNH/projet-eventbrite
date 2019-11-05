class UsersController < ApplicationController

  def show
    p current_user
    
    @user_events = current_user.created_events
  end
  
end
