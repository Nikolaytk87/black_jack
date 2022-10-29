# frozen_string_literal: true

require_relative 'player'
require_relative 'dealer'
require_relative 'game'
require_relative 'deck'
require_relative 'inputs'
# The main interface that controls the flow of the game
class Interface
  include Deck
  include Inputs
  attr_reader :player, :dealer, :game

  def init_users(player_name, dealer_name)
    @player = Player.new(name: player_name)
    @dealer = Dealer.new(name: dealer_name)
  end

  def main_menu
    init_users(input_player_name, 'BJDealer')
    menu
  end

  def menu
    check_balance
    deck = generate_deck
    @game = Game.new(player, dealer, deck)
    round
    try_again
  end

  def try_again
    choice = input_continue
    case choice
    when '1' then menu
    when '0' then puts 'Game Over'
    end
  end

  def check_balance
    return unless player.bank.zero? || dealer.bank.zero?

    puts 'The game is over due to a zero balance of one of the players'
    exit
  end

  def round
    game.reset_cards
    game.handout
    game.show_info(player)
    game.bet
    game.player_move(input_player_choice)
    game.show_balance
  end
end
