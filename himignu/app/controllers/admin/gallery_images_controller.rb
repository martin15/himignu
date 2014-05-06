class Admin::GalleryImagesController < Admin::ApplicationController
  before_filter :set_page_selection
  before_filter :find_gallery, :only => [:create, :show, :destroy,
                                          :edit, :update, :set_primary]
  before_filter :find_gallery_image, :only => [:show, :destroy, :edit,
                                               :update, :set_primary]

  def create
    if params[:gallery].nil?
      flash[:error] = "Gallery Image failed to create"
      redirect_to admin_gallery_path(@gallery.permalink)
      return
    end
    @gallery_image = GalleryImage.new(:gallery_image => params[:gallery][:gallery_image])
    @gallery_image.gallery = @gallery
    if @gallery_image.save
      flash[:notice] = "Gallery Image successfully created"
    else
      flash[:error] = "Gallery Image failed to create"
    end
    redirect_to admin_gallery_path(@gallery.permalink)
  end

  def edit; end

  def update
    if @gallery_image.update_attributes(params[:gallery_image])
      flash[:notice] = "Gallery Image successfully updated"
      redirect_to admin_gallery_path(@gallery.permalink)
    else
      flash[:error] = "Gallery Image failed to update"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] = @gallery_image.destroy ? 'Gallery Image was successfully deleted.' :
                                      'Gallery Image was falied to delete.'
    redirect_to admin_gallery_path(@gallery.permalink)
  end

  def set_primary
    if @gallery_image.change_primary_image
      flash[:notice] = "Gallery Image successfully set as Primary Image"
    else
      flash[:error] = "Gallery Image failed to set as Primary Image"
    end
    redirect_to admin_gallery_path(@gallery.permalink)
  end

  private
    def find_gallery
      @gallery = Gallery.find_by_permalink(params[:gallery_id])
      if @gallery.nil?
        flash[:error] = "Cannot find the Gallery with name '#{params[:gallery_id]}'"
        redirect_to admin_galleries_path
      end
    end

    def find_gallery_image
      @gallery_image = GalleryImage.find_by_id(params[:id])
      if @gallery_image.nil?
        flash[:error] = "Cannot find the Gallery Image with id '#{params[:id]}'"
        redirect_to admin_gallery_path(@gallery.permalink)
      end
    end

    def set_page_selection
      @gallery_selected = "selected"
    end
end
