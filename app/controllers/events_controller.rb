class EventsController < ApplicationController
  def index
    week = params[:week] ? Date.parse(params[:week]) : Date.today
    @start_of_week = week.beginning_of_week
    @end_of_week = week.end_of_week
    @event = Event.new
    @events = Event.where(
      'start_date <= ? and end_date >=?', @end_of_week, @start_of_week
    )

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @events }
    end
  end
end
