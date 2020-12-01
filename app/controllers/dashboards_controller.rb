class DashboardsController < ApplicationController
  def dashboard
    @pending_bookings = current_user.bookings.where(status: "pending")
    @owner_bookings = current_user.costumes.map(&:bookings).flatten
  end
end
