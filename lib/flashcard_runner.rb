require 'pry'
require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'
require './lib/card_generator.rb'

filename = "./lib/cards.txt"
cards = CardGenerator.new(filename).cards
deck = Deck.new(cards)
round = Round.new(deck)

puts "Welcome! You're playing with #{deck.count} cards."
puts "---------------------------------------------------"

round.deck.cards.each do |card|
  puts "This is card number #{round.card_count.to_i + 1} out of #{round.deck.count}."
  puts "Question: #{card.question}"
  user_input = gets.chomp.to_s
  round.record_guess(user_input)
  puts round.guesses.last.feedback
end
puts "***** Game over! *****"
puts "You had #{round.number_correct.to_i} correct guesses out of #{round.deck.count} for a score of #{round.percent_correct.to_i}%."
