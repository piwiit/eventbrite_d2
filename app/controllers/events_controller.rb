class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new]
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event =
      Event.create(
        start_date: params[:start_date],
        duration: params[:duration],
        title: params[:title],
        description: params[:description],
        price: params[:price],
        location: params[:location],
        admin_id: current_user.id
      )
    @event.picture.attach(params[:picture])
    if @event.save
      redirect_to event_path(@event.id)
    else
      render :new
    end
  end

  def new
    @event = Event.new
  end

  def edit; end

  def update; end

  def destroy; end
end
