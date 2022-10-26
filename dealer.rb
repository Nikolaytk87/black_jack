class Dealer
  def initialize(name: 'BJDealer')
    super(name)
    @bank = 100
    @score = 0
    @rate = 10
    @current_cards ||= []
  end
end
