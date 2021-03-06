class EventsController < ApplicationController

  before_action :authenticate_user, only: [:new, :create, :edit, :update]

  def index
    @events = Event.all
  end

  def new
    @new_event = Event.new
  end

  def create
    @new_event = Event.new(
      title: params[:title],
      start_date: params[:start_date],
      duration: params[:duration],
      description: params[:description],
      price: params[:price],
      location: params[:location],
      user: current_user
    )

    @new_event.photo.attach(params[:photo])

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
