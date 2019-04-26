class ArtistPolicy < ApplicationPolicy
  def index?
    true
  end
 
  def create?
    user.present?
  end
 
  def update?
    return true if user.present? && user.admin?
  end
 
  def destroy?
    return true if user.present? && user.admin?
  end
 
  private
 
    def artist
      record
    end
end