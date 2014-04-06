class AboutUsController < ApplicationController

  def index
    @about_selected = "selected"
    @about_us = Information.find_by_name("About Us")
  end
end
