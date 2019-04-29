class SendUsersNotificationJob < ApplicationJob
  queue_as :default 
  # Tareas en cola por default

  def perform
    # Reportar a todos los usuarios y solo a usuarios
    users = User.all
    # Reportar solo los siguientes resultados
    # Most popular songs, artists and albums
    UserMailer.report_most_popular_songs(users)
    UserMailer.report_most_popular_artists(users)
    UserMailer.report_most_popular_albums(users)
  end
end

