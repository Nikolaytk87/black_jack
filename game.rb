require_relative 'inputs'
class Game
  include Inputs
  attr_reader :player, :dealer
  attr_accessor :deck, :bank

  def initialize(player, dealer, deck)
    @deck = deck
    @player = player
    @dealer = dealer
    @bank = 0
  end

  def show_cards(user)
    puts "#{user.name} cards:\n#{user.card_names}"
  end

  def show_points(user)
    puts "#{user.name} points: #{user.points}"
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
    if player.cards.size == 2
      card = player.cards.concat(give_cards).last
      puts "Add card #{card.name} #{card.suit} ALL_Points: #{player.points}"
      maximum_cards? ? open_cards : dealer_move
    else
      puts 'Too much cards'
      maximum_cards? ? open_cards : player_move(input_player_choice)
    end
  end

  def dealer_move
    puts "Now the Dealer's move"
    dealer.cards.concat(give_cards) if dealer.points < dealer.limit
    puts 'Dealer made a move'
    maximum_cards? ? open_cards : player_move(input_player_choice)
  end

  def maximum_cards?
    player.cards.size >= 3 && dealer.cards.size >= 3
  end

  def open_cards
    show_cards(player)
    show_points(player)
    show_cards(dealer)
    show_points(dealer)
    calculating
  end

  def calculating
    diff_player = 21 - player.points
    diff_dealer = 21 - dealer.points
    if diff_player.negative? || (diff_player > diff_dealer && !diff_dealer.negative?)
      dealer.bank += bank
      puts "Alas,#{player.name} you lost"
    elsif diff_player < diff_dealer || diff_dealer.negative?
      player.bank += bank
      puts "Congratulations, #{player.name} you won"
    elsif player.points == dealer.points
      puts 'Tie. Number of points equal'
      self.bank /= 2
      player.bank += bank
      dealer.bank += bank
    end
    self.bank = 0
  end

  protected

  attr_accessor :game_bank
end
