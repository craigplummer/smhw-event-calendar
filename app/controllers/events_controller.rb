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

  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event
    else
      render json: { errors: @event.errors.full_messages }, status: 422
    end
  end

  private

  def event_params
    params.require(:event).permit(:description, :start_date, :end_date)
  end
end
