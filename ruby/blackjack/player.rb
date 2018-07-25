class Player

  def initialize(dealer)
    @dealer = dealer
    @turn = true
  end

  def deal_me_in
    @hand = @dealer.deal
  end

  def hit
    @hand << @dealer.deal_hit
  end

  def stay
    @turn = !@turn
  end

  def player_turn

  end

  def dealers_up_card
    @dealer.up_card
  end
end

