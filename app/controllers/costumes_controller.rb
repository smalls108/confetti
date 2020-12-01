class CostumesController < ApplicationController

 before_action :set_costume, only: [:show]

  def index
    @costumes = Costume.all
  end

  def show
    @booking = Booking.new
    @reviews = @costume.reviews
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_costume
    @costume = Costume.find(params[:id])
  end
end
