require_relative 'user'
class Player < User
  def initialize(name: 'Bot', bank: 100)
    @bank = bank
    @cards ||= []
    super(name)
  end
end
