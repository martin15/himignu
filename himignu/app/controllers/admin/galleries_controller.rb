class Admin::GalleriesController < Admin::ApplicationController
  before_filter :set_page_selection
  before_filter :find_gallery, :only => [:destroy, :edit, :update, :show]

  def index
    @galleries = Gallery.paginate(:page => params[:page], :per_page => 10,
                                  :order => "created_at DESC" )
    @no = params[:page].to_i * 10
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(params[:gallery])
    if @gallery.save
      flash[:notice] = "Gallery successfully created"
      redirect_to admin_galleries_path
    else
      flash[:error] = "Gallery failed to create"
      render :action => "new"
    end
  end

  def show
    @gallery_image = GalleryImage.new
    @gallery_images = @gallery.gallery_images
  end

  def edit; end

  def update
    if @gallery.update_attributes(params[:gallery])
      flash[:notice] = "Gallery successfully updated"
      redirect_to admin_galleries_path
    else
      flash[:error] = "Gallery failed to update"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] =  @gallery.destroy ? 'Gallery was successfully deleted.' :
                                      'Gallery was falied to delete.'
    redirect_to admin_galleries_path
  end

  private
    def find_gallery
      @gallery = Gallery.find_by_permalink(params[:id])
      if @gallery.nil?
        flash[:error] = "Cannot find the Gallery with name '#{params[:id]}'"
        redirect_to admin_galleries_path
      end
    end

    def set_page_selection
      @gallery_selected = "selected"
    end
end
