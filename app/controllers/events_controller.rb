class EventsController < ApplicationController
  def create 
    @event = Event.create(event_params)

    render json: { event: @event}
  end

  private

  def user_params
    params.require(:event).permit(:name, :location)
  end

end