require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/card'


class CardTest < Minitest::Test

  def test_card_has_question
    #skip
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_equal "What is the capital of Alaska?", card.question
  end

  def test_card_has_answer
    #skip
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_equal "Juneau", card.answer
  end

end
