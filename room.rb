require('pry')

class Room

  attr_reader :name, :capacity, :price

  def initialize(name, capacity, price)
    @name = name
    @capacity = capacity
    @price = price

    @guests = []
    @songs = []

    @bar = Bar.new()
  end

  def get_songs()
    return @songs
  end

  def add_songs(*songs)
    #@songs << song
    songs.each { |song| @songs << song }
  end

  def get_occupants()
    return @guests
  end

  def get_bar_till_balance
    return @bar.get_till_balance
  end

  def get_bar_receipts
    return @bar.get_receipts
  end

  def space_in_room?()
    return @guests.length < capacity
  end

  def add_guest(guest)
    @guests << guest
  end

  def check_out_guest(guest)
    return @guests.delete(guest)
  end

  def check_in_guests(*guests)
    guests.each { |guest|
      if space_in_room?()
        @bar.vend_item(guest, self, self)
        add_guest(guest)
      end
    }
  end


end
