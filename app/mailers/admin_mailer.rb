class AdminMailer < ApplicationMailer
  default from: 'notifications@myblog.com'

  def admin_welcome
    @admin = params[:admin]
    mail(to: @admin.email, subject: 'Welcome to Apple Music')
  end

  def admin_created
    @admin = params[:admin]
    mail(to: @admin.email, subject: 'New Admin Created')
  end

  def self.query_less_popular_songs
    Song.joins(:ratings).where("ratings.value = -1").group("id").order("COUNT(ratings.ratingable_id) DESC").limit(5)
  end

  def self.query_most_rated_songs
    Song.joins(:ratings).group("id").order("SUM(ratings.value) DESC").limit(5)
  end

  def self.report_less_popular_songs(users)
    unpopular_songs = query_less_popular_songs
    new_data = unpopular_songs.reduce(""){ | cad, song | "#{cad},#{song.id}"}
    # unless = reverse if
    unless $unpopular_songs && $lunpopular_songs == new_data
      $unpopular_songs = new_data
      users.each do |user|
        send_updated_info(user, unpopular_songs, 'Less popular songs').deliver_now
      end
    end
  end

   def self.report_most_rated_songs(users)
    rated_songs = query_most_rated_songs
    new_data = rated_songs.reduce(""){ | cad, song | "#{cad},#{song.id}"}
    unless $rated_songs && $rated_songs == new_data
      $rated_songs = new_data
      users.each do |user|
        send_updated_info(user, rated_songs, 'Most rated songs').deliver_now
      end
    end
  end

   def send_updated_info(user, data, mail_subject)
    @user = user
    @data = data
    @msg = mail_subject
    email_with_name = %("#{user.username}" <#{user.email}>)
    mail(to: email_with_name, subject: mail_subject)
  end

end
