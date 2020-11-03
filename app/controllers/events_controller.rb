class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def create; end

  def new; end

  def edit; end

  def update; end

  def destroy; end
end
