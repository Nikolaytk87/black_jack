class Game
  attr_reader :player, :dealer
  attr_accessor :deck

  def initialize(player, dealer, deck)
    @deck = deck
    @player = player
    @dealer = dealer
    @issued_cards = []
  end

  def result_calculation; end

  def show_cards; end

  def give_cards(number_of_cards: 1)
    deck.shift(number_of_cards)
  end

  # сделать ставку
  def bet; end
end
