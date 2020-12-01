class CostumesController < ApplicationController

 before_action :set_costume, only: [:show, :edit, :update, :destroy]

  def index
    @costumes = Costume.all
  end

  def show
    @booking = Booking.new
    @reviews = @costume.reviews
    authorize @costume
  end

  def edit
    authorize @costume
  end

  def update
    authorize @costume
    if @costume.update(costume_params)
      redirect_to costume_path(@costume)
    else
        render :new
    end
  end

  def new
    @costume = Costume.new
    authorize @costume
  end

  def create
    @costume = Costume.new(costume_params)
    @costume.user = current_user
    authorize @costume
    if @costume.save
      redirect_to costume_path(@costume)
    else
      render :new
    end
  end

  def destroy
    authorize @costume
    @costume.destroy
    redirect_to costumes_path
  end

  private

  def set_costume
    @costume = Costume.find(params[:id])
  end

  def costume_params
    params.require(:costume).permit(:name, :description, :price, :size, :gender, photos: [])
  end

end
