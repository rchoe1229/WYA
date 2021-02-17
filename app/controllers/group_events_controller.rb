class GroupEventsController < ApplicationController
  
  def show
    @group_events = GroupEvent.find(params[:id])
    render json: @group_events
  end
  
  
  def create 
    @group_event = GroupEvent.create(
      name: params[:name],
      user_id: params[:user_id],
      event_id: params[:event_id]
    )

    render json: @group_event
  end

end