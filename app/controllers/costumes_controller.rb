class CostumesController < ApplicationController
  before_action :set_costume, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @costumes = Costume.all
    if params[:search].present?
      if params[:search][:city].present?
        @costumes = @costumes.where("city ILIKE ?", "%#{params[:search][:city]}%")
      end

      if params[:search][:gender].present?
        @costumes = @costumes.where(gender: params[:gender])
      end

      if params[:search][:size].present?
        @costumes = @costumes.where(size: params[:size])
      end
    end

    @markers = Costume.geocoded.map do |costume|
      {
        lat: costume.latitude,
        lng: costume.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { costume: costume })
      }
    end
  end

  def show
    authorize @costume
    @booking = Booking.new
    @reviews = @costume.reviews
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
    params.require(:costume).permit(:name, :description, :price, :size, :gender, :city, photos: [])
  end
end
