class EventsController < ApplicationController
  def index
    if params[:week]
      @events = Event.weeks_events(params[:week])
    else
      @events = Event.all
    end
    @event = Event.new

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @events }
    end
  end
end
