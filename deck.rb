class Deck
  CARDS = [['2', 2], ['3', 3], ['4', 4], ['5', 5], ['6', 6], ['7', 7], ['8', 8], ['9', 9], ['10', 10], ['J', 10],
           ['Q', 10], ['K', 10], ['A', 11]]
  SUITS = %w[hearts diamonds clubs spades]
  def self.deck
    deck = []

    CARDS.each do |name, points|
      SUITS.each do |suit|
        deck << { name: name, suit: suit, points: points }
      end
    end
    deck
  end
end
