require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../bar')
require_relative('../song')
require_relative('../room')


class RoomTest < Minitest::Test

  def setup
    @purple_haze = Song.new("Purple Haze", "Jimi Hendrix", "Rock")
    @every_little_thing_she_does_is_magic = Song.new("", "Police", "New Wave")
    @uptown_girl = Song.new("Uptown Girl", "Billy Joel", "Pop")

    @alan = Guest.new("Alan", 50, @purple_haze)
    @bob = Guest.new("Bob", 35, @every_little_thing_she_does_is_magic)
    @chris = Guest.new("Chris", 70, @uptown_girl)

    @bar1 = Bar.new()

    @room1 = Room.new("Room 1", 25, 5)
    @room2 = Room.new("Room 1", 1, 5)
  end

  def test_room_has_name
    assert_equal("Room 1", @room1.name)
  end

  def test_room_has_capacity
    assert_equal(25, @room1.capacity)
  end

  def test_room_price
    assert_equal(5, @room1.price)
  end

  def test_room_songs_list__empty
    assert_equal([], @room1.get_songs())
  end

  def test_room_can_add_song__single
    @room1.add_songs(@purple_haze)
    assert_equal([@purple_haze], @room1.get_songs())
  end

  def test_room_can_add_song__multiple
    @room1.add_songs(@purple_haze, @every_little_thing_she_does_is_magic, @uptown_girl)
    assert_equal([@purple_haze, @every_little_thing_she_does_is_magic, @uptown_girl], @room1.get_songs())
  end

  def test_room_can_get_occupants__empty
    assert_equal([], @room1.get_occupants())
  end

  def test_room_can_add_guests__single
    @room1.add_guest(@alan)
    assert_equal([@alan], @room1.get_occupants())
  end

  def test_room_can_add_guests__multiple
    @room1.add_guest(@alan)
    @room1.add_guest(@bob)
    assert_equal([@alan, @bob], @room1.get_occupants())
  end

  def test_space_in_room__space
    assert_equal(true, @room2.space_in_room?())
  end

  def test_space_in_room__no_space
    @room2.add_guest(@alan)
    assert_equal(false, @room2.space_in_room?())
  end

  def test_room_can_check_out_guest
    @room1.add_guest(@alan)
    @room1.add_guest(@bob)
    result = @room1.check_out_guest(@bob)
    assert_equal([@alan], @room1.get_occupants())
    assert_equal(@bob, result)
  end

  def test_room_can_check_guests_in__below_capacity
    @room1.check_in_guests(@alan, @bob)
    assert_equal([@alan, @bob], @room1.get_occupants())
    assert_equal(10, @room1.get_bar_till_balance())
    assert_equal([{location: @room1, item: @room1}, {location: @room1, item: @room1}], @room1.get_bar_receipts())
  end

  def test_room_can_check_guests_in__above_capacity
    @room2.check_in_guests(@alan, @bob)
    assert_equal([@alan], @room2.get_occupants())
    assert_equal(5, @room2.get_bar_till_balance())
    assert_equal([{location: @room2, item: @room2}], @room2.get_bar_receipts())
  end

end
