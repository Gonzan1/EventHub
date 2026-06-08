class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  def index
    @events = Event.includes(:category, :venue, :organizer).all
  end

  def show
    @event = Event.includes(:category, :venue, :organizer, :reviews, :attendees).find(params[:id])
    
    # Variables preparadas para los formularios en la vista "Show"
    @registration = @event.registrations.find_by(user: current_user)
    @new_review = Review.new
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.organizer = current_user

    if @event.save
      redirect_to @event, notice: "Event was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: "Event was successfully cancelled/deleted."
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    # Aquí :description funciona mágicamente con ActionText
    params.require(:event).permit(:title, :description, :start_date, :end_date, :capacity, :category_id, :venue_id, :status)
  end
end