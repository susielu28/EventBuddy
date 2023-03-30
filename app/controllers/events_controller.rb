class EventsController < ApplicationController
  include EventsHelper

  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  # GET /events
  def index
    @events = Event.all
    @events = Event.order(date: :asc)
    apply_filters if params
    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {event: event}),
        marker_html: render_to_string(partial: "marker")
      }
  end

    if user_signed_in?
      @suggestions = []
      current_user.interest_list.each do |interest|
        @suggestions << Event.where(genre: interest)
      end
      @suggestions.flatten!
    end
  end

  # GET /events/1
  def show
    @markers = [{
      lat: @event.latitude,
      lng: @event.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: {event: @event}),
      marker_html: render_to_string(partial: "marker")
    }]
    @event = Event.find(params[:id])
    @comment = Comment.new
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

  def attend
    @event = Event.find(params[:event_id])
    event_member = @event.event_members.new(user: current_user)
    if event_member.save
      flash.notice = "You are now attending this event."
    else
      flash.alert = "There was an error joining the event. Please try again."
    end
    redirect_to event_path(@event)
  end

  def unattend
    @event = Event.find(params[:event_id])
    event_member = @event.event_members.find_by(user: current_user)
    if event_member&.destroy
      flash.notice = "You are no longer attending this event."
    else
      flash.alert = "An error occurred while removing you from the event."
    end
    redirect_to @event
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
    puts params.inspect
    @events = Event.search_all_events(params[:query]) if params[:query].present? && params[:query] != ""
    @events = @events.where('name ILIKE ?', "%#{params[:name]}%") if params[:name].present? && params[:name] != ""
    @events = @events.where('venue ILIKE ?', "%#{params[:venue]}%") if params[:venue].present? && params[:venue] != ""
    @events = @events.where('genre ILIKE ?', "%#{params[:genre]}%") if params[:genre].present? && params[:genre] != ""
    @events = @events.where(date: DateTime.parse(params[:date_min])..DateTime.parse(params[:date_max])) if (params[:date_min].present? && params[:date_min] != "") && (params[:date_max].present? && params[:date_max] != "")
    @events = @events.where('price >= ? AND price <= ?', params[:price_min], params[:price_max]) if params[:price_min].present? && params[:price_max].present?
  end
end
