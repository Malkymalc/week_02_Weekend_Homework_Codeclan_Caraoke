class Venue

  attr_reader :name, :rooms

  def initialize(name)
    @name = name
    @rooms = []
    @songs = []
    @guests_lobby = []
  end

  def list_songs()
    return @songs
  end

  def list_guests()
    return @guests_lobby
  end

  def add_room(name, capacity, cost)
    @rooms << Room.new(name, capacity, cost)
  end

  def add_song(title, artist, genre)
    @song << Song.new(title, artist, genre)
  end

  def add_guest(name, money, fav_song)
    @guests_lobby << Guest.new(name,money, fav_song)
  end

  def check_guest_into_room(room, *guests)
    room.check_in_guests(guests)
  end

  def check_guest_out_of_room(room, *guests)
    room.check_out_guest(guests)
  end

end
