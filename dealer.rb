require_relative 'user'
class Dealer < User
  attr_reader :limit

  def initialize(name: 'BJDealer', bank: 100)
    super(name)
    @bank = bank
    @cards ||= []
    @rate = 10
    @limit = 17
    super(name)
  end
end
