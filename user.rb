class User
  attr_reader :name, :bank, :cards, :score, :rate

  def initialize(name)
    @name = name
  end

  protected

  attr_writer :bank, :score, :cards
end
