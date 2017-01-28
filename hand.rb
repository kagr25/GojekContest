class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end
  def hit!(deck)
    @cards << deck.cards.shift
  end

  def cards
    @cards.collect{|card| card.to_s}
  end

  def value
    value_11_a > 21 ? value_1_a : value_11_a
  end

  def value_1_a
    @cards.inject(0) {|sum, card| sum += card.value(1) }
  end

  def value_11_a
    @cards.inject(0) {|sum, card| sum += card.value(11) }
  end

  def play_as_dealer(deck)
    if value_11_a < 17 || value_1_a < 17
      hit!(deck)
      play_as_dealer(deck)
    end
  end
end
