class InformationsController < ApplicationController

  def show
    @information_selected = "selected"
    @event = "empty"
    @informations = Information.other_informations.select([:name, :permalink])
    unless params[:id] == "empty"
      @information = Information.find_by_permalink(params[:id])
      if @information.nil?
        @information = Information.first || "empty"
        flash[:error] = "Cannot find Information with name '#{params[:id]}'"
      end
    end
  end
end
