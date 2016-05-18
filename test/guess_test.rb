require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/card'
require './lib/guess'

class GuessTest < Minitest::Test

  def test_guess_has_card
    #skip
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_instance_of Card, guess.card
  end

  def test_guess_has_response
    #skip
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Juneau", guess.response
  end

  def test_guess_response_is_correct
    #skip
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal true, guess.correct?
  end

  def test_guess_has_feedback_for_correct_response
    #skip
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Correct!", guess.feedback
  end

  def test_guess_response_is_incorrect
    #skip
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)
    assert_equal false, guess.correct?
  end

  def test_guess_has_feedback_for_incorrect_response
    #skip
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)
    assert_equal "Incorrect.", guess.feedback
  end

end
