class EventsController < ApplicationController

  before_action :authenticate_user, only: [:index, :new, :create, :edit, :update]
  
  def index
    @events = Event.all
  end
  
  def new
    @new_event = Event.new
  end
  
  def create 
    p params
    
    @new_event = Event.new(
      title: params[:title],
      start_date: params[:start_date],
      duration: params[:duration],
      description: params[:description],
      price: params[:price],
      location: params[:location],
      user: current_user
    )
    
    if @new_event.save
      redirect_to @new_event
    else
      render 'new'
    end
    
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_user_session_path
    end
  end
  
end
