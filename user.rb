class User
  attr_reader :name, :bank, :current_cards, :score, :rate

  def initialize(name)
    @name = name
  end

  protected

  attr_writer :bank, :score
end
