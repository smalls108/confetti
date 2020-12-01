class CostumesController < ApplicationController

 before_action :set_costume, only: [:show]

  def index
    @costumes = Costume.all
  end

  def show
    @booking = Booking.new
    @reviews = @costume.reviews
  end

  private

  def set_costume
    @costume = Costume.find(params[:id])
  end
end
