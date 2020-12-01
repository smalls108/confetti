class CostumesController < ApplicationController

 before_action :set_costume, only: [:show]

  def index
    @costumes = Costume.all
  end

  def show
    @booking = Booking.new
    @reviews = @costume.reviews
  end

  def edit
  end 

  def create
    if @costume.update(costume_params)
      redirect_to costume_path(@costume)
    else
        render :new
      end
  end

  private

  def set_costume
    @costume = Costume.find(params[:id])
  end
end
