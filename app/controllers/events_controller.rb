class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /events
  def index
    @events = Event.all
    apply_filters
    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude
      }
    end
  end

  # GET /events/1
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    if @event.user != current_user
      redirect_to events_path, alert: "You can only edit your own events."
    end
  end

  # POST /events
  def create
    @event = Event.new(event_params)
    @event.user = current_user

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.user == current_user
      if @event.update(event_params)
        redirect_to @event, notice: 'Event was successfully updated.'
      else
        render :edit
      end
    else
      redirect_to events_path, alert: "You can only edit your own events."
    end
  end

  # DELETE /events/1
  def destroy
    if @event.user == current_user
      @event.destroy
      redirect_to events_path, notice: 'Event was successfully destroyed.'
    else
      redirect_to events_path, alert: "You can only delete your own events."
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:name, :date, :price, :venue, :genre, :info, :photo)
  end

  def apply_filters
    @events = @events.where('name ILIKE ?', "%#{params[:name]}%") if params[:name] != ""
    @events = @events.where('venue ILIKE ?', "%#{params[:venue]}%") if params[:venue] != ""
    @events = @events.where('genre ILIKE ?', "%#{params[:genre]}%") if params[:genre] != ""
    @events = Event.search_all_events(params[:query]) if params[:query] != ""
    @events = @events.select { |event| event.date >= DateTime.parse(params[:date_min]) && event.date <= DateTime.parse(params[:date_max]) } if params[:date_min] != "" && params[:date_max] != ""
    @events = @events.select { |event| event.price >= params[:price_min].to_i && event.price <= params[:price_max].to_i } if params[:price_min] != "" && params[:price_max] != ""
  end
end
