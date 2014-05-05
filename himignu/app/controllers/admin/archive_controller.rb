class Admin::ArchiveController < Admin::ApplicationController
  before_filter :set_page_selection
  before_filter :find_event, :only => [:new, :create, :show, :destroy,
                                          :edit, :update]
  before_filter :find_event_archive, :only => [:show, :destroy, :edit,
                                               :update, :set_primary]

  def new
    @event_archive = Event.new
  end

  def create
    @event_archive = Event.new(params[:event])
    @event_archive.event = @event
    @event_archive.name = @event.name
    @event_archive.year = @event_archive.held_on.try(:year)
    if @event_archive.save
      flash[:notice] = "Event Archive successfully created"
      redirect_to admin_events_path
    else
      flash[:error] = "Event Archive failed to create"
      render :action => "new"
    end
  end

  def show
    @event = @event_archive
    @event_image = EventImage.new
    @event_images = @event.event_images
  end

  def edit; end

  def update
    params[:event][:year] = @event_archive.held_on.try(:year)
    if @event_archive.update_attributes(params[:event])
      flash[:notice] = "Event Archive successfully updated"
      redirect_to admin_events_path
    else
      flash[:error] = "Event Archive failed to update"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] = @event_archive.destroy ? 'Event Archive was successfully deleted.' :
                                      'Event Archive was falied to delete.'
    redirect_to admin_events_path
  end

  private
    def find_event
      @event = Event.find_by_permalink(params[:event_id])
      if @event.nil?
        flash[:error] = "Cannot find the Event with name '#{params[:event_id]}'"
        redirect_to admin_events_path
      end
    end

    def find_event_archive
      @event_archive = Event.find_by_id(params[:id])
      @valid = true if @event_archive.event == @event
      if @valid.nil?
        flash[:error] = "Cannot find the Event Archive'"
        redirect_to admin_events_path
      end
    end

    def set_page_selection
      @event_selected = "selected"
    end
end
