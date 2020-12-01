class DashboardsController < ApplicationController
  def dashboard
    @pending_bookings = current_user.bookings.where(status: "pending")
  end
end
