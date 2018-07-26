require './deck.rb'
require './hand.rb'
require './player.rb'

class Dealer
  attr_reader :dealer_hand

  def initialize(deck)
    @deck = deck
    @turn = false
  end

  def deal
    @dealer_hand = Hand.new
    @player_hand = Hand.new

    2.times do
      [@player_hand, @dealer_hand].each { |hand| hand.cards << deal_card }
    end

    return @player_hand unless @player_hand.blackjack? || @dealer_hand.blackjack?

    blackjack_on_deal
    game_outcome

    #this hand is returned solely for testing purposes
    @player_hand
  end

  def take_turn
    @turn = !@turn
    while @turn
      if @dealer_hand.value >= 17
        @turn = !@turn
        game_outcome
      else
        @dealer_hand.cards << deal_card
      end
    end
  end

  def deal_card
    @deck.deal_card
  end

  def up_card
    @dealer_hand.cards[0]
  end

  def game_outcome
    if @player_hand.blackjack?
      puts "Make it rain!!! \n\n"
    elsif @dealer_hand.blackjack?
      puts "Tough luck. The house always wins... \n\n"
    elsif @player_hand.bust?
      puts "Bust! You lose with #{@player_hand.value}! \n\n"
    elsif @dealer_hand.bust?
      puts "The dealer has busted with #{dealer_hand.value}! \n\nPlayer wins with #{@player_hand.value}! \n\n"
    elsif @player_hand.value < @dealer_hand.value
      puts "Dealer wins with #{@dealer_hand.value}! \n\n"
    elsif @dealer_hand.value == @player_hand.value
      puts "Dealer stands at #{@dealer_hand.value}.\n Push! \n   ---Just like losing, but with less shame...\n\n"
    else
      puts "Dealer stands at #{@dealer_hand.value}.\n\nPlayer wins with #{@player_hand.value}! \n\n"
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
