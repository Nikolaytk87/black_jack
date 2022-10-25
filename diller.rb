class Diller
  attr_reader :name, :bank

  def initialize(name: 'Diller')
    @name = name
    @bank = 100
  end

  protected

  attr_writer :bank
end
