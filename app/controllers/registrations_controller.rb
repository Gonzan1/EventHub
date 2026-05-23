class RegistrationsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @registration = @event.registrations.build(user: current_user)
    
    if @registration.save
      redirect_to @event, notice: "Success! You are registered for this event."
    else
      redirect_to @event, alert: @registration.errors.full_messages.to_sentence
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @registration = @event.registrations.find(params[:id])
    
    @registration.destroy
    redirect_to @event, notice: "Registration cancelled successfully."
  end
end