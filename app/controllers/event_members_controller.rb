# app/controllers/event_members_controller.rb

class EventMembersController < ApplicationController
  before_action :set_event, only: [:create]
  before_action :authenticate_user!

  def create
    @event_member = EventMember.new(user_id: current_user.id)
    @event_member.event = @event

    if @event_member.save
      redirect_to @event, notice: 'You have successfully joined the event.'
    else
      redirect_to @event, alert: 'Error joining the event. Please try again.'
    end
  end

  def destroy
    @event_member = EventMember.find(params[:id])

    if @event_member
      @event_member.destroy
      redirect_to @event_member.event, notice: 'You have successfully left the event.'
    else
      redirect_to @@event_member.event, alert: 'Error leaving the event. Please try again.'
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
