class AboutUsController < ApplicationController

  def index
    @about_selected = "selected"
    @bg_color = "bg-hijau-tosca.jpg"
    @about_us = Information.find_by_name("About Us")
  end
end
