class Admin::EventImagesController < Admin::ApplicationController
  before_filter :set_page_selection
  before_filter :find_event, :only => [:create, :show, :destroy,
                                          :edit, :update]
  before_filter :find_event_image, :only => [:show, :destroy, :edit,
                                               :update, :set_primary]

  def create
    @event_image = EventImage.new(:event_image => params[:event][:event_image])
    @event_image.event = @event
    if @event_image.save
      flash[:notice] = "Event Image successfully created"
    else
      flash[:error] = "Event Image failed to create"
    end
    if @event.is_archive?
      return redirect_to admin_event_archive_path(:id => @event.id,
                                                  :event_id => @event.event.permalink)
    end
    redirect_to admin_event_path(@event.permalink)
  end

  def edit; end

  def update
    if @event_image.update_attributes(params[:event_image])
      flash[:notice] = "Event Image successfully updated"
      redirect_to admin_event_path(@event.permalink)
    else
      flash[:error] = "Event Image failed to update"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] = @event_image.destroy ? 'Event Image was successfully deleted.' :
                                      'Event Image was falied to delete.'
    redirect_to admin_event_path(@event.permalink)
  end

  private
    def find_event
      @event = Event.find_by_permalink(params[:event_id])
      if @event.nil?
        flash[:error] = "Cannot find the Event with name '#{params[:event_id]}'"
        redirect_to admin_events_path
      end
    end

    def find_event_image
      @event_image = EventImage.find_by_id(params[:id])
      if @event_image.nil?
        flash[:error] = "Cannot find the Event Image with id '#{params[:id]}'"
        redirect_to admin_event_path(@event.permalink)
      end
    end

    def set_page_selection
      @event_selected = "selected"
    end
end
