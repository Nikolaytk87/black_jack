class Player
  attr_reader :name, :bank

  def initialize(name)
    @name = name
    @bank = 100
  end

  protected

  attr_writer :bank
end
