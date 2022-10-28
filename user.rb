# frozen_string_literal: true

class User
  MAX_POINTS = 21
  MAX_ACE_VALUE = 11
  MIN_ACE_VALUE = 1
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

  def card_names
    cards.map(&:name)
  end

  def card_suits
    cards.map(&:suit)
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
