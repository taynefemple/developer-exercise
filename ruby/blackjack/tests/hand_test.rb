require 'test/unit'
require_relative '../hand.rb'
require_relative '../card.rb'

class HandTest < Test::Unit::TestCase
  def setup
    @hand = Hand.new
  end

  def test_new_hand_has_two_cards
    @hand.cards << Card.new(:spade, :queen, 10)
    @hand.cards << Card.new(:heart, :two, 2)
    assert_equal @hand.card_count, 2
  end

  def test_hand_is_blackjack
    @hand.cards << Card.new(:spade, :ace, [1, 11])
    @hand.cards << Card.new(:heart, :ten, 10)
    assert @hand.blackjack?
  end

  def test_hand_value_with_high_ace
    @hand.cards << Card.new(:spade, :ace, [1, 11])
    @hand.cards << Card.new(:heart, :two, 2)
    assert_equal @hand.value, 13
  end

  def test_hand_value_with_low_ace
    @hand.cards << Card.new(:spade, :ace, [1, 11])
    @hand.cards << Card.new(:heart, :king, 10)
    @hand.cards << Card.new(:heart, :three, 3)
    assert_equal @hand.value, 14
  end

  def test_hand_value_with_multiple_aces
    @hand.cards << Card.new(:spade, :ace, [1, 11])
    @hand.cards << Card.new(:heart, :seven, 7)
    @hand.cards << Card.new(:heart, :ace, [1, 11])
    assert_equal @hand.value, 19
  end

  def test_hand_is_bust
    hand = Hand.new
    hand.cards << Card.new(:spade, :four, 4)
    hand.cards << Card.new(:heart, :ten, 10)
    hand.cards << Card.new(:diamond, :eight, 8)
    assert hand.bust?
  end
end
