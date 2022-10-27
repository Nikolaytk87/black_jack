class User
  attr_reader :name, :cards
  attr_accessor :bank

  def initialize(name)
    @name = name
  end

  def points
    cards.map(&:points).sum
  end

  def card_names
    cards.map { |card| "'#{card.name} #{card.suit}'" }.join(', ')
  end

  def reset_cards
    self.cards = []
  end

  protected

  attr_writer :cards
end
