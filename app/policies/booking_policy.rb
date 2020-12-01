class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.costume.user != user
  end

  def accept
    record.costume.user == user && record.status == "pending"
  end

   def reject
    record.costume.user == user && record.status == "pending"
  end
end
