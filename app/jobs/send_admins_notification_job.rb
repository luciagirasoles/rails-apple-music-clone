class SendAdminsNotificationJob < ApplicationJob
  queue_as :default

  def perform
    admins = User.where(role: "admin")
    AdminMailer.report_less_popular_songs(admins)
    AdminMailer.report_most_rated_songs(admins)
  end
end
