require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def test_card_generator_returns_array
    #skip
    filename = "./lib/cards.txt"
    cards = CardGenerator.new(filename).cards
    assert_instance_of Array, cards
  end

  def test_card_generator_array_holds_cards
    #skip
    filename = "./lib/cards.txt"
    cards = CardGenerator.new(filename).cards
    assert_instance_of Card, cards.first
  end

  def test_card_generator_contains_question_and_answer
    #skip
    filename = "./lib/cards.txt"
    cards = CardGenerator.new(filename).cards
    assert_equal "What is 5 + 5?", cards.first.question
    assert_equal "10", cards.first.answer
  end


  def test_card_generator_contains_more_than_one_question_and_answer
    #skip
    filename = "./lib/cards.txt"
    cards = CardGenerator.new(filename).cards
    assert_equal "What cardboard cutout lives at Turing?", cards.last.question
    assert_equal "Justin bieber", cards.last.answer
  end

end
