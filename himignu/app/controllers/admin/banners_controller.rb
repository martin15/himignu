class Admin::BannersController < Admin::ApplicationController
  before_filter :find_banner, :only => [:show, :destroy, :edit,
                                               :update, :set_primary]

  def new
    @banner = Banner.new
    @banners = Banner.all
  end

  def create
    @banner = Banner.new(params[:banner])
    if @banner.save
      flash[:notice] = "Banner successfully created"
      redirect_to new_admin_banner_path
    else
      flash[:error] = "Banner failed to create"
      render :action => 'new'
    end
  end

  def edit; end

  def update
    if @banner.update_attributes(params[:banner])
      flash[:notice] = "Banner successfully updated"
      redirect_to new_admin_banner_path
    else
      flash[:error] = "Banner failed to update"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] = @banner.destroy ? 'Banner was successfully deleted.' :
                                      'Banner was falied to delete.'
    redirect_to new_admin_banner_path
  end

  private
    def find_banner
      @banner = Banner.find_by_id(params[:id])
      if @banner.nil?
        flash[:error] = "Cannot find the Banner with id '#{params[:id]}'"
        redirect_to new_admin_banner_path
      end
    end
end
