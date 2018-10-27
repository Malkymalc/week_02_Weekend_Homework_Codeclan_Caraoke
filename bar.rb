class Bar

  def initialize
    @till = 0
    @receipts = []
  end

  def get_till_balance
    return @till
  end

  def get_receipts
    return @receipts
  end

  def vend_item(guest, item, room)
    #take money from guest
    cash = guest.pay_money(item.price)
    #add money to till
    @till += cash
    #add receipt
    receipt = {
      location: room,
      item: item,
    }
    @receipts << receipt
  end
end
