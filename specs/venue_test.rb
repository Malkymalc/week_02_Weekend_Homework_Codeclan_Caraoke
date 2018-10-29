require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../song')
require_relative('../room')
require_relative('../venue')

class VenueTest < Minitest::Test

  def setup

    @purple_haze = Song.new("Purple Haze", "Jimi Hendrix", "Rock")
    @every_little_thing_she_does_is_magic = Song.new("", "Police", "New Wave")
    @uptown_girl = Song.new("Uptown Girl", "Billy Joel", "Pop")

    @alan = Guest.new("Alan", 50, @purple_haze)
    @bob = Guest.new("Bob", 35, @every_little_thing_she_does_is_magic)
    @chris = Guest.new("Chris", 70, @uptown_girl)

    @room1 = Room.new("Room 1", 25, 5)
    @room2 = Room.new("Room 1", 1, 5)

    @venue1 = Venue.new("Codeclan Caraoke")
  end

  def test_venue_has_name
    assert_equal("Codeclan Caraoke", @venue1.name)
  end

  def test_venue_has_rooms__no_rooms
    assert_equal([], @venue1.rooms)
  end

  def test_venue_has_songs__no_songs
    assert_equal([], @venue1.list_songs())
  end

  def test_venue_has_guests__no_guests
    assert_equal([], @venue1.list_guests())
  end

  def test_venue_can_add_room
    @venue1.add_room("roomA", 25, 5)
    assert_equal("roomA", @venue1.rooms[0].name)
    assert_equal(25, @venue1.rooms[0].capacity)
  end

  def test_venue_can_add_song
    @venue1.add_song("I Want You", "Bob Dylan", "Folk Rock")
    assert_equal("I Want You", @venue1.list_songs[0].title)
  end

  def test_venue_can_add_guest
    @venue1.add_guest("Bob", 40, 4)
    assert_equal("Bob", @venue1.list_guests[0].name)
  end

  def test_venue_can_check_in_guest_to_room
    @venue1.add_room("roomA", 25, 5)
    @venue1.add_guest("Bob", 40, @purple_haze)
    @venue1.check_guest_into_room(@venue1.rooms[0], @venue1.list_guests[0])

    room_actual_guest = @venue1.rooms[0].get_occupants[0].name
    room_actual_till = @venue1.rooms[0].get_bar_till_balance

    assert_equal("Bob", room_actual_guest)
    assert_equal(5, room_actual_till)
    assert_equal([], @venue1.list_guests())
  end

  def test_venue_can_check_out_guest_from_room
    @venue1.add_room("roomA", 25, 5)
    @venue1.add_guest("Bob", 40, @purple_haze)
    @venue1.check_guest_into_room(@venue1.rooms[0],@venue1.list_guests[0])
    @venue1.check_guest_out_of_room(@venue1.rooms[0],@venue1.rooms[0].get_occupants()[0])

    room_actual_guests = @venue1.rooms[0].get_occupants()
    room_actual_till = @venue1.rooms[0].get_bar_till_balance
    venue_actual_guest_name = @venue1.list_guests()[0].name

    assert_equal([], room_actual_guests)
    assert_equal(5, room_actual_till)
    assert_equal("Bob", venue_actual_guest_name)
  end

  #
  #
  # def test_venue_can_get_total_takings
  #   assert_equal(10, @venue1.total_takings())
  # end
  #
  # def test_venue_can_get_takings_per_room
  #
  # end

end
