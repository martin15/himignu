class GalleriesController < ApplicationController
  before_filter :set_page_selection
  before_filter :find_gallery, :only => [:show]

  def index
    @galleries = Gallery.all
  end

  def show
    @gallery_images = @gallery.gallery_images
  end

  private
    def set_page_selection
      @gallery_selected = "selected"
    end

    def find_gallery
      @gallery = Gallery.find_by_permalink(params[:id])
      if @gallery.nil?
        flash[:error] = "Cannot find gallery with name '#{params[:id]}'"
      end
    end
end
