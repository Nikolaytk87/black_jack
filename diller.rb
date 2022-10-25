class Diller
  attr_reader :name, :bank, :current_cards

  def initialize(name: 'Diller')
    @name = name
    @bank = 100
    @current_cards ||= []
  end

  protected

  attr_writer :bank
end
