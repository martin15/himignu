class EventsController < ApplicationController

  def show
    @event_selected = "selected"
    @bg_color = "bg-biru-muda.jpg"
    @event = "empty"
    @event_images = []
    @main_events = Event.main_events
    @archive_events = Event.all_archives.select([:name, :permalink, :year]).
                            group_by{ |h| h.year }
    unless params[:id] == "empty"
      @event = Event.find_by_permalink(params[:id])
      if @event.nil?
        unless Event.popular_event.nil?
          @event = Event.popular_event
          @event_images = @event.event_images
        else
          @event = "empty"
        end
      else
        @event = @event.popular_event unless @event.is_archive?
        @event_images = @event.event_images
      end
    end
  end
end
