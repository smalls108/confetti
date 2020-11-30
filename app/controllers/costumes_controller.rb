class CostumesController < ApplicationController
  def index
    @costumes = Costume.all
  end

  private
  def set_costume
    @costume = Costume.find(params[:costume_id])
  end
end
