require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

class FlashcardsTest < Minitest::Test

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

  def test_deck_has_cards
    #skip
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal [card_1, card_2, card_3], deck.cards
  end

  def test_count_number_of_cards_in_deck
    #skip
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal 3, deck.count
  end

  def test_round_contains_deck
    #skip
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Deck, round.deck
  end

  def test_round_records_guesses
    #skip
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal [], round.guesses
  end

  def test_round_contains_card
    #skip
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Card, round.current_card
  end

  def test_round_records_a_guess
    #skip
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Guess, round.record_guess("Juneau")
  end

  def test_count_guesses_stored_in_round
    #skip
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")
    assert_equal 1, round.guesses.count
  end

  def test_round_returns_correct_for_first_guess
    #skip
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")
    assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_number_of_questions_answered_correctly
    #skip
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")
    assert_equal 1, round.number_correct
  end

  def test_round_changes_to_next_card_after_a_guess
    #skip
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.current_card
    round.record_guess("Juneau")
    assert_instance_of Card, round.current_card
  end

  def test_round_records_a_guess_for_another_next_card
    #skip
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.current_card
    round.record_guess("Juneau")
    round.current_card
    assert_instance_of Guess, round.record_guess("2")
  end

  def test_guess_count_increases
    #skip
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.current_card
    round.record_guess("Juneau")
    round.current_card
    round.record_guess("2")
    assert_equal 2, round.guesses.count
  end

  def test_round_returns_incorrect_for_last_guess
    #skip
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.current_card
    round.record_guess("Juneau")
    round.current_card
    round.record_guess("2")
    assert_equal "Incorrect.", round.guesses.last.feedback
  end

  def test_round_returns_number_correct_after_an_incorrect_guess_is_made
    #skip
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")
    round.record_guess("2")
    assert_equal 1, round.number_correct
  end

  def test_round_returns_percent_of_correct_guesses
    #skip
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")
    round.record_guess("2")
    assert_equal 50, round.percent_correct
  end

  def test_card_generator_returns_array
    #skip
    filename = "./lib/cards.txt"
    cards = CardGenerator.new(filename).cards
    assert_instance_of Array, cards
  end

  def test_card_generator_holds_cards
    #skip
    filename = "./lib/cards.txt"
    cards = CardGenerator.new(filename).cards
    assert_instance_of Card, cards.first
  end

  def test_card_generator_contains_question
    #skip
    filename = "./lib/cards.txt"
    cards = CardGenerator.new(filename).cards
    assert_equal "What is 5 + 5?", cards.first.question
  end

  def test_card_generator_contains_answer
    #skip
    filename = "./lib/cards.txt"
    cards = CardGenerator.new(filename).cards
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
