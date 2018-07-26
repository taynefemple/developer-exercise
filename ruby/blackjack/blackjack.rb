require "./dealer"
require "./deck"
require "./player"

dealer = Dealer.new(Deck.new)
player = Player.new(dealer)

puts "\nPlace your bets!\n\n"

player.deal_me_in

if player.hand.blackjack? || dealer.dealer_hand.blackjack?
  exit
end

puts "Player dealt #{player.hand.value}"
puts "Dealer's 'up' card is #{dealer.up_card.name}\n\n"

puts "Player will hit or stand"
player.player_turn

if player.hand.bust?
  exit
end

puts "Player stands at #{player.hand.value}\n\n"

puts "Dealer has #{dealer.dealer_hand.value}. Will hit or stand"
dealer.take_turn
