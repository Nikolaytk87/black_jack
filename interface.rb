require_relative 'player'
require_relative 'dealer'
require_relative 'game'
require_relative 'deck'
class Interface
  include Deck
  attr_accessor :menu
  attr_reader :player, :dealer, :game

  def initialize; end

  def input_name
    puts 'Input your name: '
    gets.chomp
  end

  def init_users(player_name, dealer_name)
    @player = Player.new(name: player_name)
    @dealer = Dealer.new(name: dealer_name)
  end

  def main_menu
    player_name = input_name
    init_users(player_name, 'BJDealer')
    deck = generate_deck
    @game = Game.new(player, dealer, deck)
    player.cards.push(*game.give_cards(number_of_cards: 2))
    dealer.cards.push(*game.give_cards(number_of_cards: 2))
  end

  def show_menu; end
end
