class Admin::InformationsController < Admin::ApplicationController
  before_filter :set_page_selection
  before_filter :find_information, :only => [:destroy, :edit, :update, :show]

  def index
    names = ["About Us", "PPIT", "Short PPIT"]
    @informations = Information.where('name not in (?)', names).
                                paginate(:page => params[:page], :per_page => 10,
                                  :order => "created_at DESC" )
    @no = params[:page].to_i * 10
  end

  def new
    @information = Information.new
  end

  def create
    @information = Information.new(params[:information])
    if @information.save
      flash[:notice] = "Information successfully created"
      redirect_to admin_informations_path
    else
      flash[:error] = "Information failed to create"
      render :action => "new"
    end
  end

  def edit
    (@ppit_selected = "selected";@information_selected="") if params[:id] == "ppit"
    (@about_selected = "selected";@information_selected="") if params[:id] == "about-us"
  end

  def update
    if @information.update_attributes(params[:information])
      flash[:notice] = "Information successfully updated"
      if @information.fix_information?
        render :action => "edit"
        return
      end
      redirect_to admin_informations_path
    else
      flash[:error] = "Information failed to update"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] =  @information.destroy ? 'Information was successfully deleted.' :
                                      'Information was falied to delete.'
    redirect_to admin_informations_path
  end

  private
    def find_information
      @information = Information.find_by_permalink(params[:id])
      if @information.nil?
        flash[:error] = "Cannot find the Information with id '#{params[:id]}'"
        redirect_to admin_informations_path
      end
    end

    def set_page_selection
      @information_selected = "selected"
    end
end
