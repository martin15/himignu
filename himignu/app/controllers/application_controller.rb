class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_default_data


  private
    def load_default_data
      @data_info = Information.where("is_popular = 1").limit(1)[0].permalink
      @data_info = "empty" if @data_info.empty?
      @data_event = Event.where("name = 'MKI'")[0].permalink || "empty"
      @data_event = "empty" if @data_event.empty?
    end

end
