class User
  attr_reader :name, :cards
  attr_accessor :bank, :rate

  def initialize(name)
    @name = name
  end

  def points
    cards.map(&:points).sum
  end

  # def ace?
  #   cards.each { |card| card.name }
  # end

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
end
