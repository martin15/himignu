class AboutUsController < ApplicationController

  def show
    @about_selected = "selected"
    @bg_color = "bg-hijau-tosca.jpg"
    @about_us = Information.find_by_permalink(params[:id])
    if @about_us.nil?
      flash[:error] = "Cannot find information about '#{params[:id]}'"
      redirect_to about_us_path("himignu")
    end
  end
end
