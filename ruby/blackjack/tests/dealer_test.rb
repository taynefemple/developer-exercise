require 'test/unit'
require_relative '../player.rb'
require_relative '../dealer.rb'
require_relative '../deck.rb'

class DealerTest < Test::Unit::TestCase
  def setup
    @dealer = Dealer.new(Deck.new)
    @player = Player.new(@dealer)
  end

  def test_2_cards_dealt_at_start
    @player.deal_me_in
    assert_equal @dealer.dealer_hand.cards.count, 2
  end
end
