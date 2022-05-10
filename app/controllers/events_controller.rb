class EventsController < ApplicationController
  before_action :authenticate_user, except: :index

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def update
    @event = Event.find(params[:id])

    if params[:commit] == 'Yes, I will Attend!'
      @event.update(attendance: true)
    else
      @event.update(attendance: false)
    end

    redirect_to event_path(@event)
  end

  def create
    user = User.find(session[:user_id])
    @event = user.events.build(form_params)

    if @event.save
      redirect_to root_path, notice: 'Event successfully created!'
    else
      render :new, status: :internal_server_error
    end
  end

  private

  def form_params
    params.require(:event).permit(:title, :description, :date, :venue)
  end
end
