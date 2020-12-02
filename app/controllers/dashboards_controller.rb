class DashboardsController < ApplicationController
  skip_after_action :verify_authorized, only: [:dashboard]
  def dashboard
    @renter_pending_bookings = current_user.bookings.where(status: "pending")
    @owner_bookings = current_user.costumes.map(&:bookings).flatten
    @renter_completed_bookings = current_user.bookings.where(status: "accepted").where("end_date < ?", Date.today)
  end
end
