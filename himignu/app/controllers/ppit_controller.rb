class PpitController < ApplicationController

  def index
    @ppit_selected = "selected"
    @bg_color = "bg-coklat-muda.jpg"
    @ppit = Information.find_by_permalink("PPIT")
  end
end
