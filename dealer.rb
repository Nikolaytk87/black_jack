# frozen_string_literal: true

require_relative 'user'
# Object Dealer
class Dealer < User
  LIMIT = 17
  def initialize(name: 'BJDealer', bank: 100)
    super(name)
    @bank = bank
    @cards ||= []
    @rate = 10
    @limit = 17
    super(name)
  end

  def score_less_limit?
    score < LIMIT
  end
end
