class Player
  attr_reader :hand # now hand is available

  def initialize(dealer)
    @dealer = dealer
    @turn = true
  end

  def deal_me_in
    @hand = @dealer.deal
  end

  def player_turn
    while @turn
      hit_or_stand?
    end
  end

  def hit_or_stand?
    if dealers_advantage || weak_hands
      hit
      if @hand.bust?
        @dealer.game_outcome
      end
    else
      stand
    end
  end

  def hit
    @hand << @dealer.deal_card
  end

  def stand
    @turn = !@turn
  end

  def dealers_up_card
    @dealer.up_card
  end

  def dealers_advantage
    (dealers_up_card.name == :ace || dealers_up_card.value > 6) &&
      @hand.value < 16
  end

  def weak_hands
    dealers_up_card.value < 7 && @hand.value.between?(4, 13)
  end
end
