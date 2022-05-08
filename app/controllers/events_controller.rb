class EventsController < ApplicationController
  before_action :authenticate_user, except: :index

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(form_params)

    if @event.save
      redirect_to root_path, notice: 'Event successfully created!'
    else
      render :new, status: :internal_server_error
    end
  end

  private

  def form_params
    params.require(:event).permit(:title, :description, :date)
  end
end
