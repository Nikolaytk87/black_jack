# frozen_string_literal: true

require_relative 'user'
class Player < User
  def initialize(name: 'Bot', bank: 100)
    @bank = bank
    @cards ||= []
    @rate = 10
    super(name)
  end
end
