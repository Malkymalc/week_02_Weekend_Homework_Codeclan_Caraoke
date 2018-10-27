require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../bar')
require_relative('../room')


class BarTest < Minitest::Test

  def setup
    @alan = Guest.new("Alan", 50, @purple_haze)
    @bob = Guest.new("Bob", 35, @every_little_thing_she_does_is_magic)
    @chris = Guest.new("Chris", 70, @uptown_girl)

    @bar1 = Bar.new()

    @room1 = Room.new("Room 1", 25, 5)
  end

  def test_bar_can_get_till_balance
    assert_equal(0, @bar1.get_till_balance())
  end

  def test_bar_can_get_receipts__no_receipts
    assert_equal([], @bar1.get_receipts())
  end


  def test_bar_can_vend_item
    @bar1.vend_item(@alan, @room1, @room1)
    assert_equal(45, @alan.check_wallet())
    assert_equal([{location: @room1, item: @room1}], @bar1.get_receipts())
    assert_equal(5, @bar1.get_till_balance())
  end





end
