require_relative 'user'
class Dealer < User
  def initialize(name: 'BJDealer', bank: 100)
    super(name)
    @bank = bank
    @score = 0
    @rate = 10
    @cards ||= []
    super(name)
  end
end
