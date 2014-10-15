#!/usr/bin/env ruby
class MediaPlayer
  attr_reader :songs, :playlists

  def initialize
    @songs = []
    @playlists = []
  end

  def add_song(name, artist)
    song = Song.new(name, artist)
    @songs.push(song)
    song
  end

  def add_playlist(name)
    playlist = Playlist.new(name)
    @playlists.push(playlist)
    playlist
  end

  def get_song_by_name(name)
    result = []
    @songs.each do |song|
      result.push(song) if song.name == name
    end

    if result.length > 0
      result
    else
      'No songs found.'
    end
  end

  def get_song_by_artist(artist)
    result = []
    @songs.each do |song|
      result.push(song) if song.artist == artist
    end

    if result.length > 0
      result
    else
      'No songs found.'
    end
  end

  def shuffle!
    @songs.shuffle!
  end

  class Song
    attr_reader :name, :artist

    def initialize(name, artist)
      @name = name
      @artist = artist
    end

    def to_s
      "'#{@name}' by '#{@artist}'"
    end
  end

  class Playlist
    attr_reader :name, :list

    def initialize(name)
      @name = name
      @list = []
    end

    def add_all(songs)
      songs.each do |song|
        @list.push(song)
      end
    end

    def to_s
      name
    end
  end
end

mp3_player = MediaPlayer.new
puts mp3_player.add_song('Highway Star', 'Deep Purple')
puts mp3_player.add_song('Dangerous', 'Big Data')
puts mp3_player.add_song('Tongues', 'Joywave')
puts mp3_player.add_song('Smoke on the Water', 'Deep Purple')
puts ''
deep_purple_hits = mp3_player.add_playlist('Deep Purple Greatest Hits')
puts deep_purple_hits
deep_purple_hits.add_all(mp3_player.get_song_by_artist('Deep Purple'))
puts deep_purple_hits.list
puts ''
puts 'get_song_by_name Tongues'
puts mp3_player.get_song_by_name('Tongues')
puts 'get_song_by_artist Big Data'
puts mp3_player.get_song_by_artist('Big Data')
puts 'get_song_by_artist Deep Purple'
puts mp3_player.get_song_by_artist('Deep Purple')
puts ''
puts 'All Songs:'
puts mp3_player.songs
puts ''
puts 'Shuffle Songs'
mp3_player.shuffle!
puts mp3_player.songs
