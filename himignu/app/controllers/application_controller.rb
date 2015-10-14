class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_default_data
  before_filter :params_validation

  def params_validation
    unless params[:page].to_s != "0" && (params[:page].nil? || /^\d+$/ =~ params[:page])
      respond_to do |format|
        format.html { render :file => "#{Rails.root}/public/404",
                             :layout => false, :status => :not_found }
      end
    end
  end


  private
    def load_default_data
      @data_info = Information.where("is_popular = 1").limit(1)
      @data_info = @data_info.empty? ? "empty" : @data_info[0].permalink
      @data_event = Event.popular_event
      @data_event = @data_event.nil? ? "empty" : @data_event.permalink
      @contact_us = Information.find_by_name("Contact Us")
    end

end
