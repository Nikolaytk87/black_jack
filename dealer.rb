class Dealer
  attr_reader :name, :bank, :current_cards, :score, :rate

  def initialize(name: 'Diller')
    @name = name
    @bank = 100
    @score = 0
    @rate = 10
    @current_cards ||= []
  end

  protected

  attr_writer :bank, :score
end
