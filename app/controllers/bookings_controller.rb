class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

 # /costumes/:costume_id/bookings
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @costume = Costume.find(params[:costume_id])
    @booking.costume = @costume
    if @booking.save
      redirect_to dashboard_path
    else
      render "costumes/show"
    end
  end

  def accept
    @booking.status = "accepted"
  end

  def reject
    @booking.status = "rejected"
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end

end

