require 'pry'
require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is 5 + 5?", "10")
card_2 = Card.new("What is Rachel's favourite animal?", "red panda")
card_3 = Card.new("What is Mike's middle name?", "nobody knows")
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber")
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)

puts "Welcome! You're playing with #{deck.count} cards."
puts "---------------------------------------------------"

round.deck.cards.each do |card|
  puts "This is card number #{round.card_count.to_i} out of #{round.deck.count}."
  puts "Question: #{card.question}"
  user_input = gets.chomp.to_s
  round.record_guess(user_input)
  puts round.guesses.last.feedback
end
puts "***** Game over! *****"
puts "You had #{round.number_correct.to_i} correct guesses out of #{round.deck.count} for a score of #{round.percent_correct}%."
