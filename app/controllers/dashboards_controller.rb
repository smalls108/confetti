class DashboardsController < ApplicationController
  skip_after_action :verify_authorized, only: [:dashboard]
  def dashboard
    @renter_pending_bookings = current_user.bookings.where(status: "pending")
    @renter_accepted_bookings = current_user.bookings.where(status: "accepted")
    @renter_rejected_bookings = current_user.bookings.where(status: "rejected")
    @owner_bookings = Booking.joins(:costume).where(costumes: {user_id: current_user.id})
    @owner_completed_bookings = @owner_bookings.where(status: "accepted").where("end_date < ?", Date.today)
    @renter_completed_bookings = current_user.bookings.where(status: "accepted").where("end_date < ?", Date.today)
  end
end
