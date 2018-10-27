require('minitest/autorun')
require('minitest/rg')
require_relative('../song')

class SongTest < Minitest::Test

  def setup
    @purple_haze = Song.new("Purple Haze", "Jimi Hendrix", "Rock")
    @every_little_thing_she_does_is_magic = Song.new("", "Police", "New Wave")
    @uptown_girl = Song.new("Uptown Girl", "Billy Joel", "Pop")
  end

  def test_song_has_title
    assert_equal("Purple Haze", @purple_haze.title)
  end

  def test_song_has_artist
    assert_equal("Police", @every_little_thing_she_does_is_magic.artist)
  end

  def test_song_has_genre
    assert_equal("Pop", @uptown_girl.genre)
  end

end
