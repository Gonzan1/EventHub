class EventsController < ApplicationController
  def index
    # Traemos todos los eventos e incluimos sus asociaciones para mayor eficiencia
    @events = Event.includes(:category, :venue, :organizer).all
  end

  def show
    # Buscamos un evento específico por su ID
    @event = Event.includes(:category, :venue, :organizer, :reviews, :attendees).find(params[:id])
  end
end