class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  def index
    render json: Event.all
  end

  def create
    event = Event.new(event_params)
    if event.save
      render json: event, status: :created, location: event
    else
      render json: event.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @event
  end

  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event)
          .permit(:name, :location, :date,
                  :description)
  end
end
