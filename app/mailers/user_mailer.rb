class UserMailer < ApplicationMailer
  default from: 'notifications@myblog.com'
  return_path: 'iamdeyvi@gmail.com'

  def welcome_user(user)
    @user = user
    @songs = Song.joins(:ratings).where("ratings.value = 1").group("id").order("COUNT(ratings.ratingable_id) DESC").limit(5)
    email_with_name = %("#{@user.username}" <#{@user.email}>)
    mail(to: email_with_name, subject: 'Listen Latest Apple Music Hits')
  end 

  def self.query_top5_songs
    Song.joins(:ratings).where("ratings.value = 1").group("id").order("COUNT(ratings.ratingable_id) DESC").limit(5)
  end

  def self.query_top5_albums
    Album.joins(:ratings).where("ratings.value = 1").group("id").order("COUNT(ratings.ratingable_id) DESC").limit(5)
  end

  def self.query_top5_artists
    Artist.joins(songs: :ratings).where("ratings.value = 1").group("id").order("COUNT(ratings.ratingable_id) DESC").limit(5)
  end

  def self.report_most_popular_songs(users)
    top5_songs = query_top5_songs
    new_data = top5_songs.reduce(""){ | cad, song | "#{cad},#{song.id}"}
    unless $top5_songs && $top5_songs == new_data
      $top5_songs = new_data
      users.each do |user|
        send_updated_info(user, top5_songs, 'Top5 songs').deliver_now
      end
    end
  end

   def self.report_most_popular_albums(users)
    top5_albums = query_top5_albums
    new_data = top5_albums.reduce(""){ | cad, album | "#{cad},#{album.id}"}
    unless $top5_albums && $top5_albums == new_data
      $top5_albums = new_data
      users.each do |user|
        send_updated_info(user, top5_albums, 'Top5 albums').deliver_now
      end
    end
  end

   def self.report_most_popular_artists(users)
    top5_artists = query_top5_artists
    new_data = top5_artists.reduce(""){ | cad, artist | "#{cad},#{artist.id}"}
    unless $top5_artists && $top5_artists == new_data
      $top5_artists = new_data
      users.each do |user|
        send_updated_info(user, top5_artists, 'Top5 artists').deliver_now
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

  def user_welcome
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to Apple Music')
  end

  def user_created
    @admin = params[:user]
    mail(to: @admin.email, subject: 'New User Created')
  end

end
