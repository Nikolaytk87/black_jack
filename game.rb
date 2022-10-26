require_relative 'deck'
class Game
  include Deck

  attr_accessor :deck

  def initialize
    @deck = generate_deck
    @issued_cards = []
  end

  def result_calculation; end

  def show_cards; end

  def give_cards(number_of_cards = 1)
    deck.shift(number_of_cards)
  end
end
