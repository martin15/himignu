class InformationsController < ApplicationController

  def show
    @information_selected = "selected"
    @information = "empty"
    @informations = Information.other_informations
    unless params[:id] == "empty"
      @information = Information.find_by_permalink(params[:id])
      if @information.nil?
        flash[:error] = "Cannot find Information with name '#{params[:id]}'"
	if @informations.first.nil?
          @information = "empty"
	  redirect_to information_path(@information)
        else
          @information = @informations.first
	  redirect_to information_path(@information.permalink)
        end
      end
    end
  end
end
