require_relative 'user'
class Player < User
  def initialize(name: 'Bot', bank: 100)
    @bank = bank
    @score = 0
    @rate = 10
    @cards ||= []
    super(name)
  end
end
