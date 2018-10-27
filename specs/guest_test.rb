require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../song')


class GuestTest < Minitest::Test

  def setup
    @purple_haze = Song.new("Purple Haze", "Jimi Hendrix", "Rock")
    @every_little_thing_she_does_is_magic = Song.new("", "Police", "New Wave")
    @uptown_girl = Song.new("Uptown Girl", "Billy Joel", "Pop")

    @alan = Guest.new("Alan", 50, @purple_haze)
    @bob = Guest.new("Bob", 35, @every_little_thing_she_does_is_magic)
    @chris = Guest.new("Chris", 70, @uptown_girl)
  end

  def test_guest_has_name
    assert_equal("Alan", @alan.name)
  end

  def test_guest_can_check_wallet
    assert_equal(35, @bob.check_wallet())
  end

  def test_guest_can_pay_money
    assert_equal(70, @chris.check_wallet())
    result = @chris.pay_money(10)
    assert_equal(10, result)
    assert_equal(60, @chris.check_wallet())
  end

  def test_guest_can_say_fav_song
    assert_equal(@purple_haze, @alan.say_fav_song())
  end

end
