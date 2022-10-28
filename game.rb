# frozen_string_literal: true

require_relative 'inputs'
class Game
  MAX_POINTS = 21
  include Inputs
  attr_reader :player, :dealer
  attr_accessor :deck, :bank

  def initialize(player, dealer, deck)
    @deck = deck
    @player = player
    @dealer = dealer
    @bank = 0
  end

  def show_info(user)
    cards = [user.card_names, user.card_suits].transpose
    print "#{user.name} cards: "
    cards.each { |card| print "'#{card.join(' ')}'", ' ' }
    puts "\nALL Points: #{user.score}"
  end

  def show_balance
    puts "#{dealer.name} balance $#{dealer.bank}"
    puts "#{player.name}: Your balance $#{player.bank}"
  end

  def give_cards(number_of_cards: 1)
    deck.shift(number_of_cards)
  end

  def handout
    player.cards.concat(give_cards(number_of_cards: 2))
    dealer.cards.concat(give_cards(number_of_cards: 2))
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
    card = player.cards.concat(give_cards).last
    puts "Add card #{card.name} #{card.suit}. All Points: #{player.score}"
    maximum_cards? ? open_cards : dealer_move
  end

  def dealer_move
    if dealer.score < dealer.limit
      dealer.cards.concat(give_cards)
      puts "#{dealer.name} took another card"
    else
      puts "#{dealer.name} skip move"
    end
    maximum_cards? ? open_cards : player_move(input_player_choice)
  end

  def maximum_cards?
    player.cards.size >= 3 && dealer.cards.size >= 3
  end

  def open_cards
    puts 'Opening the cards'
    show_info(player)
    show_info(dealer)
    calculating
  end

  def calculating
    diff_player = MAX_POINTS - player.score
    diff_dealer = MAX_POINTS - dealer.score
    if diff_player.negative? || (diff_player > diff_dealer && !diff_dealer.negative?)
      action_player_lost
    elsif diff_player < diff_dealer || diff_dealer.negative?
      action_player_win
    elsif player.score == dealer.score
      action_tie
    end
    self.bank = 0
  end

  def action_player_lost
    dealer.bank += bank
    puts "Alas,#{player.name} you lost"
  end

  def action_player_win
    player.bank += bank
    puts "Congratulations, #{player.name} you won"
  end

  def action_tie
    puts 'Tie. Number of points equal'
    split_users_bank
  end

  def split_users_bank
    self.bank /= 2
    player.bank += bank
    dealer.bank += bank
  end
end
