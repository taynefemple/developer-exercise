class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def value
    if @cards.sum > 21 && @cards.has?(:ace)


  end

  private





end
