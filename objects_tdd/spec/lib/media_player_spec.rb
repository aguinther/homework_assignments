require 'rspec'
require_relative '../../lib/media_player'

describe MediaPlayer do
  describe '#new' do
    context 'Default settings' do
      it 'should have no playlists' do
        expect(subject.playlists).to eq([])
      end
      it 'should have no songs' do
        expect(subject.songs).to eq([])
      end
    end
  end

  describe '#add_song(name, artist)' do
    context 'when the parameters are strings' do
      it 'creates a new song object and adds it to songs' do
        subject.add_song('Dangerous', 'Big Data')
        expect(subject.songs.length).to eq(1)
      end
      it 'returns the song' do
        expect(subject.add_song('Dangerous', 'Big Data').class).to eq(MediaPlayer::Song)
      end
    end
    context 'when a parameter is not a string' do
      it 'returns an error message' do
        expect(subject.add_song(1, 'Big Data')).to eq('Both parameters must be a string')
      end
      it 'does not change the songs list' do
        subject.add_song(1, 'hi')
        expect(subject.songs.length).to eq(0)
      end
    end
  end

  describe '#add_playlist(name)' do
    context 'when the parameter is a string' do
      it 'creates a Playlist object and adds it to the playlists' do
        subject.add_playlist('Greatest Hits')
        expect(subject.playlists.length).to eq(1)
      end
      it 'returns the playlist' do
        expect(subject.add_playlist('Greatest Hits').class).to eq(MediaPlayer::Playlist)
      end
    end
    context 'when the parameter is not a string' do
      it 'returns an error message' do
        expect(subject.add_playlist(1)).to eq('Parameter must be a string')
      end
      it 'does not change the playlists list' do
        subject.add_playlist(1)
        expect(subject.playlists.length).to eq(0)
      end
    end
  end

  describe '#get_song_by_artist(artist)' do
    subject do
      player = MediaPlayer.new
      player.add_song('Dangerous', 'Big Data')
      player
    end

    context 'when the parameter matches a result' do
      it 'returns all artists in the MediaPlayer with the passed in string as the artist' do
        expect(subject.get_song_by_artist('Big Data').length).to eq(1)
      end
    end
    context 'when the parameter does not match any artists' do
      it 'returns an empty array' do
        expect(subject.get_song_by_artist('Joywave')).to eq('No songs found.')
      end
    end
  end

  describe '#get_song_by_name(name)' do
    subject do
      player = MediaPlayer.new
      player.add_song('Dangerous', 'Big Data')
      player
    end

    context 'when the parameter is a string' do
      it 'returns all songs in the MediaPlayer with same name as the passed in string' do
        expect(subject.get_song_by_name('Dangerous').length).to eq(1)
      end
    end
    context 'when the parameter does not match any artists' do
      it 'returns an empty array' do
        expect(subject.get_song_by_name('Tongues')).to eq('No songs found.')
      end
    end
  end
end
