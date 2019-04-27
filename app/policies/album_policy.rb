class AlbumPolicy < ApplicationPolicy

  attr_reader :user, :song

  def initialize(user, song)
    @user = user
    @song = song
  end

  def index?
    true
  end
 
  def create?
    user.present?
  end

  def edit?
    (user.present? && user.admin?) || (user.present? && @song.user_id == user.id)
  end
 
  def update?
    (user.present? && user.admin?) || (user.present? && @song.user_id == user.id)
  end
 
  def destroy?
    user.admin? || @song.user.id == user.id
  end
 
  private
 
    def album
      record
    end
end