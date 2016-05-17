class Round

attr_reader :deck,
            :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
    @card_count = 0.0
    @number_correct = 0.0
  end

  def current_card
    #accesses the first card in the deck
    #@card_count is used to iterate through the deck of cards
    deck.cards[@card_count]
  end

  def record_guess(response)
    @response = response
    guesses << Guess.new(response, deck.cards[@card_count])
    @number_correct += 1 if @response == deck.cards[@card_count].answer
    @card_count += 1
    #Add a new guess into a guess array, with guess and current card as input
    guesses.last #Access the last element of the array
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
