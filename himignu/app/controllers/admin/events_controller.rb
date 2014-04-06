class Admin::EventsController < Admin::ApplicationController
  before_filter :set_page_selection
  before_filter :find_event, :only => [:destroy, :edit, :update, :show, :set_popular_event]

  def index
    @events = Event.main_events.paginate(:page => params[:page], :per_page => 10,
                                  :order => "created_at DESC" ).includes("archives")
    @no = params[:page].to_i * 10
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      flash[:notice] = "Event successfully created"
      redirect_to admin_events_path
    else
      flash[:error] = "Event failed to create"
      render :action => "new"
    end
  end

  def show
    @event_image = EventImage.new
    @event_images = @event.event_images
  end

  def edit; end

  def update
    if @event.update_attributes(params[:event])
      flash[:notice] = "Event successfully updated"
      redirect_to admin_events_path
    else
      flash[:error] = "Event failed to update"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] =  @event.destroy ? 'Event was successfully deleted.' :
                                      'Event was falied to delete.'
    redirect_to admin_events_path
  end

  def set_popular_event
    @event.set_popular_event
    respond_to do |format|
       format.html { redirect_to(admin_events_path)}
       format.js
    end
  end

  private
    def find_event
      @event = Event.find_by_permalink(params[:id])
      if @event.nil?
        flash[:error] = "Cannot find the Event with name '#{params[:id]}'"
        redirect_to admin_events_path
      end
    end

    def set_page_selection
      @event_selected = "selected"
    end
end
