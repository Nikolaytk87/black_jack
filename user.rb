class User
  attr_reader :name, :cards
  attr_accessor :bank, :rate

  def initialize(name)
    @name = name
  end

  def ace_eleven
    cards.find do  |card|
      card.name == 'A' && card.points == 11
    end
  end

  def score
    ace_eleven.points = 1 while ace_eleven && points > 21
    self.score = points
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

  attr_writer :cards, :score

  private

  def points
    cards.map(&:points).sum
  end
end
