class PpitController < ApplicationController

  def index
    @ppit_selected = "selected"
    @ppit = Information.find_by_name("PPIT")
  end
end
