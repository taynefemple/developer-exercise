require './card.rb'

class Hand
  attr_reader :cards

  include Enumerable

  def initialize
    @cards = []
  end

  def value
    sort!
    @cards.reduce(0) do |sum, card|
      if card.name != :ace
        sum + card.value
      elsif sum + 11 > 21
        sum + 1
      else
        sum + 11
      end
    end
  end

  def card_count
    @cards.length
  end

  def bust?
    value > 21
  end

  def blackjack?
    value == 21 && @cards.length == 2
  end

  def sort!
    @cards = @cards.sort_by { |card| card.name != :ace ? card.value : 11 }
  end
end
