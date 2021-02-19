class EventsController < ApplicationController
  def index
    authorization_header = request.headers["authorization"]
    token = authorization_header.split(" ")[1]

    if !token
      render json: { error: "No auth header!" }, status: :unauthorized
    else
      secret = Rails.application.secrets.secret_key_base[0]
      
      begin
        payload = JWT.decode(token, secret).first
        @user = User.find(payload[ "user_id" ])

        @events = Event.all

        render json: { events: @events }
      rescue
        render json: { error: "Bad toke!" }, status: :unauthorized
      end
    end
  end

  def create 
    @event = Event.create(event_params)

    render json: { event: @event}
  end

  private

  def user_params
    params.require(:event).permit(:name, :location)
  end

end