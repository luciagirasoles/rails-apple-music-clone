class SongPolicy < ApplicationPolicy

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
    # ?? & if song.user = current_user
  end

  def update?
    # return true if user.present? && 
    (user.present? && user.admin?) || (user.present? && @song.user_id == user.id) 
  end
 
  def destroy?
    # return true if (user.present? && user.admin?) || (user.present? && current_user)
    user.admin? || @song.user.id == user.id
  end
 
  private
 
    def song
      record
    end
end