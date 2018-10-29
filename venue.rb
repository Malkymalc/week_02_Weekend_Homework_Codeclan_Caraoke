require('pry')
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
    @songs << Song.new(title, artist, genre)
  end

  def add_guest(name, money, fav_song)
    @guests_lobby << Guest.new(name,money, fav_song)
  end

  def check_guest_into_room(room, *guests)
    guests.each { |guest|
      if room.space_in_room?()
        room.check_in_guests(guest)
        @guests_lobby.delete(guest)
      end
    }
  end

  def check_guest_out_of_room(room, *guests)
    guests.each { |guest|
      # binding.pry
      @guests_lobby << room.check_out_guest(guest)
    }
  end

  # def get_total_takings
  # return  @rooms.reduce(0) {|sum, room|
  #   sum += room.get_till_balance()
  #   }
  # end
  #
  # def get_room_takings(room_name)
  #   room = @rooms.find { |room|
  #     room.name == room_name
  #   }
  #   return room.get_till_balance()
  # end

end
