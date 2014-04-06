class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_default_data


  private
    def load_default_data
      @data_info = Information.where("is_popular = 1").limit(1)
      @data_info = @data_info.empty? ? "empty" : @data_info[0].permalink
      @data_event = Event.popular_event
      @data_event = @data_event.empty? ? "empty" : @data_event[0].permalink
    end

end
