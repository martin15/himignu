class HomeController < ApplicationController

  def index
    @home_selected = "selected"
    @banners = Banner.all
    @events = Event.main_events.select([:name, :permalink])
    @popular_info = Information.where("is_popular = 1").limit(3)
    @short_ppit = Information.find_by_name("Short PPIT")
    @popular_event = Event.popular_event[0]
  end
end
