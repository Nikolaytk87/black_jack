# frozen_string_literal: true

require_relative 'inputs'
require_relative 'calculating'
# Implemented the basic logic of the game
class Game
  include Inputs
  include Calculating
  attr_reader :player, :dealer, :str_round_number
  attr_accessor :deck, :bank

  def initialize(player, dealer, deck, str_round_number)
    @deck = deck
    @player = player
    @dealer = dealer
    @str_round_number = str_round_number
    @bank = 0
  end

  def show_info(user)
    cards = [user.card_names, user.card_suits].transpose
    print "#{user.name} cards: "
    cards.each { |card| print "'#{card.join}'", ' ' }
    user.show_score
  end

  def show_balance
    puts "#{dealer.name} balance $#{dealer.bank}"
    puts "#{player.name}: Your balance $#{player.bank}"
  end

  def give_card(number_of_cards: 1)
    deck.shift(number_of_cards)
  end

  def handout
    player.cards.concat(give_card(number_of_cards: 2))
    dealer.cards.concat(give_card(number_of_cards: 2))
  end

  def reset_cards
    player.reset_cards
    dealer.reset_cards
  end

  def bet
    player.bank -= player.rate
    dealer.bank -= dealer.rate
    self.bank += player.rate + dealer.rate
  end

  def player_move(choice)
    case choice
    when '1' then dealer_move
    when '2' then player_add_cards
    when '3' then open_cards
    end
  end

  def player_add_cards
    if player.max_cards?
      puts 'Too much cards'
    else
      card = player.cards.concat(give_card).last
      player.show_added_card(card)
      player.show_score
    end
    everyone_max_cards? ? open_cards : dealer_move
  end

  def dealer_move
    if dealer.score_less_limit?
      dealer_add_card
    else
      puts "#{dealer.name} skip move"
    end
    everyone_max_cards? ? open_cards : player_move(input_player_choice)
  end

  def dealer_add_card
    dealer.cards.concat(give_card)
    puts "#{dealer.name} took another card"
  end

  def everyone_max_cards?
    player.max_cards? && dealer.max_cards?
  end

  def open_cards
    puts 'Opening the cards'
    show_info(player)
    show_info(dealer)
    calculating
  end

  def split_users_bank
    self.bank /= 2
    player.bank += bank
    dealer.bank += bank
  end
end
