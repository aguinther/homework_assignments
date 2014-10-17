#!/usr/bin/env ruby
class MediaPlayer
  attr_reader :songs, :playlists

  def initialize
    @songs = []
    @playlists = []
  end

  def add_song(name, artist)
    if name.class == String && artist.class == String
      song = Song.new(name, artist)
      @songs.push(song)
      song
    else
      'Both parameters must be a string'
    end
  end

  def add_playlist(name)
    if name.class == String
      playlist = Playlist.new(name)
      @playlists.push(playlist)
      playlist
    else
      'Parameter must be a string'
    end
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
