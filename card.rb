# frozen_string_literal: true

class Card
  attr_reader :name, :suit
  attr_accessor :points

  def initialize(name, suit, points)
    @name = name
    @suit = suit
    @points = points
  end
end
