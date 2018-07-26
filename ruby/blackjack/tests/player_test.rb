require 'test/unit'
require_relative '../blackjack.rb'

class PlayerTest < Test::Unit::TestCase
  def setup
    @player = Player.new
    @dealer = Dealer.new(Deck.new)
  end

  def test_2_cards_dealt_at_start
    @player.deal_me_in
    assert_equal @player_hand.count, 2
  end

  def test_player_sees_dealers_up_card
    @player.deal_me_in
    assert_equal @dealer.up_card, @player.dealers_up_card
  end

  def test_player_can_bust_on_hit

  end

  def test_player_can_blackjack_on_deal

  end
end



