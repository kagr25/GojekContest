class Game
  attr_reader :player_hand, :dealer_hand
  def initialize
    puts "Game Start"
    @deck = Deck.new
    @player_hand = Hand.new
    @dealer_hand = Hand.new
    @winner = nil
    2.times { @player_hand.hit!(@deck) }
    2.times { @dealer_hand.hit!(@deck) }
    puts "Intial hand status: #{after_hit_status}"
  end

  def hit
    @player_hand.hit!(@deck)
    @winner = winner_after_hit(@player_hand.value)
    status = @winner.nil? ? after_hit_status : after_stand_status
    puts "After hit hand status: #{status}"
  end

  def stand
    return if !@winner.nil?
    @dealer_hand.play_as_dealer(@deck)
    @winner = decide_winner(@player_hand.value, @dealer_hand.value)
    puts "After stand hand status: #{after_stand_status}"
  end

  def after_stand_status
    {:player_cards=> @player_hand.cards,
     :player_value => @player_hand.value,
     :dealer_cards => @dealer_hand.cards,
     :dealer_value => @dealer_hand.value,
     :winner => @winner}
  end

  def after_hit_status
    {:player_cards=> @player_hand.cards,
     :player_value => @player_hand.value,
     :winner => @winner}
  end

  def decide_winner(player_value, dealer_value)
    return :dealer if player_value > 21
    return :player if dealer_value > 21
    if player_value == dealer_value
      :draw
    elsif player_value > dealer_value
      :player
    else
      :dealer
    end
  end

  def winner_after_hit(player_value)
    return :dealer if player_value > 21
    return nil
  end

  def winner
    @winner
  end

  def inspect
    status
  end
end
