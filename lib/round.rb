class Round

attr_reader :deck,
            :guesses,
            :card_count

  def initialize(deck)
    @deck           = deck
    @guesses        = []
    @card_count     = 0.0
    @number_correct = 0.0
  end

  def current_card
    #Returns first card in deck
    #card_count iterates through deck
    deck.cards[@card_count]
  end

  def record_guess(response)
    #Turn response into guess and add to array of guesses, with response and current card as input
    guesses << Guess.new(response, deck.cards[@card_count])
    #Increase number_correct if response matches the answer on card
    @number_correct += 1 if response == deck.cards[@card_count].answer
    @card_count += 1 #Iterate to next card in deck
    guesses.last #Return the most recent guess
  end

  def count
    guesses.count
  end

  def number_correct
    @number_correct
  end

  def percent_correct
    @percent_correct = @number_correct / @card_count * 100
  end


end
