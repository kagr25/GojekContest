class Card

  # suit = [:clubs, diamonds, spades, :hearts]
  attr_reader :suit, :value
  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def value(a = 11)
    return 10 if ["J", "Q", "K"].include?(@value)
    return a if @value == "A"
    return @value
  end

  def to_s
    "#{@value}-#{suit}"
  end

end
