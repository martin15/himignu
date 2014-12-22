class HomeController < ApplicationController

  def index
    @home_selected = "selected"
    @bg_color = "bg-merah.jpg"
    @banners = Banner.order("updated_at DESC")
    @events = Event.main_events.shuffle.sample(7)
    @popular_info = Information.where("is_popular = 1").limit(3)
    @short_ppit = Information.find_by_name("Short PPIT")
    @popular_event = Event.popular_event
  end
end
