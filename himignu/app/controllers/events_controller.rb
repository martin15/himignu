class EventsController < ApplicationController

  def show
    @event_selected = "selected"
    @event = "empty"
    @event_images = []
    @main_events = Event.main_events
    @archive_events = Event.all_archives.select([:name, :permalink, :year]).
                            group_by{ |h| h.year }
    unless params[:id] == "empty"
      @event = Event.find_by_permalink(params[:id])
      if @event.nil?
        unless Event.first.nil?
          @event = Event.first
          @event_images = @event.event_images
        end
        flash[:error] = "Cannot find Event with name '#{params[:id]}'"
      else
        @event_images = @event.event_images
      end
    end
  end
end
