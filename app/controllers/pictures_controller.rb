class PicturesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event.picture.attach(params[:picture_id])
    redirect_to new_event_path
  end
end
