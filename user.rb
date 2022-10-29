# frozen_string_literal: true

# Parent for  Player and Dealer objects
class User
  MAX_POINTS = 21
  MAX_ACE_VALUE = 11
  MIN_ACE_VALUE = 1
  MAX_CARDS = 3
  attr_reader :name, :cards
  attr_accessor :bank, :rate

  def initialize(name)
    @name = name
  end

  def ace_eleven
    cards.find do  |card|
      card.name == 'A' && card.points == MAX_ACE_VALUE
    end
  end

  def score
    ace_eleven.points = MIN_ACE_VALUE while ace_eleven && sum_points > MAX_POINTS
    sum_points
  end

  def diff
    MAX_POINTS - score
  end

  def card_names
    cards.map(&:name)
  end

  def max_cards?
    cards.size >= MAX_CARDS
  end

  def card_suits
    cards.map(&:suit)
  end

  def show_score
    puts "All Points: #{score}"
  end

  def show_added_card(card)
    puts "Add card #{card.name} #{card.suit}"
  end

  def reset_cards
    self.cards = []
  end

  protected

  attr_writer :cards

  private

  def sum_points
    cards.map(&:points).sum
  end
end
