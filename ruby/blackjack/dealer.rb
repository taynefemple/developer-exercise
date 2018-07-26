require './deck.rb'
require './hand.rb'
require './player.rb'

class Dealer
  def initalize(deck)
    @deck = deck
  end

  def deal
    @dealer_hand = Hand.new
    @player_hand = Hand.new

    2.times do
      [@player_hand, @dealer_hand].each { |hand| hand << deal_card }
    end

    return unless @player_hand.blackjack? || @dealer_hand.blackjack?
    blackjack_on_deal
    game_outcome
  end

  def take_turn
    if @dealer_hand.value >= 17
      game_outcome
    else
      @dealer_hand << deal_card
    end
  end

  def deal_card
    @deck.deal_card
  end

  def up_card
    @dealer_hand[0]
  end

  def game_outcome
    if @player_hand.blackjack?
      puts 'Play again and let it ride!'
    elsif @player_hand.bust?
      puts 'Bust! You lose...'
    elsif @dealer_hand.bust?
      puts 'Player wins'
    elsif @player_hand < @dealer_hand
      puts "Dealer wins with #{@dealer_hand}"
    elsif @dealer_hand == @player_hand
      puts "Dealer has #{@dealer_hand}. Push."
    else
      puts "Dealer has #{@dealer_hand}. Player wins!"
    end
  end

  def blackjack_on_deal
    if @player_hand.blackjack?
      puts 'Blackjack! Player Wins!'
    elsif @dealer_hand.blackjack?
      puts 'Dealer has Blackjack! You lose!'
    end
  end
end
