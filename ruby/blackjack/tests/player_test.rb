require 'test/unit'
require_relative '../player.rb'
require_relative '../dealer.rb'
require_relative '../deck.rb'

class PlayerTest < Test::Unit::TestCase
  def setup
    @dealer = Dealer.new(Deck.new)
    @player = Player.new(@dealer)
  end

  def test_2_cards_dealt_at_start
    @player.deal_me_in
    assert_equal @player.hand.cards.count, 2
  end

  def test_player_sees_dealers_up_card
    @player.deal_me_in
    assert_equal @dealer.up_card, @player.dealers_up_card
  end

  def test_hand_can_bust_on_hit
    @player.hand = Hand.new
    @player.hand.cards << Card.new(:spade, :four, 4)
    @player.hand.cards << Card.new(:heart, :ten, 10)
    @player.hand.cards << Card.new(:diamond, :seven, 7)
    @player.hit
    assert @player.hand.bust?
  end

  def test_player_can_blackjack_on_deal
    @player.hand = Hand.new
    @player.hand.cards << Card.new(:spade, :ace, 11)
    @player.hand.cards << Card.new(:heart, :ten, 10)
    assert @player.hand.blackjack?
  end
end
