class Guest

  attr_reader :name

  def initialize(name, wallet, fav_song)
    @name = name
    @wallet = wallet
    @fav_song = fav_song
  end

  def check_wallet
    return @wallet
  end

  def pay_money(amount)
    @wallet -= amount
    return amount
  end

  def say_fav_song
    return @fav_song
  end


end
