class Round

attr_reader :deck,
            :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
    @card_count = 0
    @number_correct = 0
  end

  def current_card
    #accesses the first card in the deck
    #@card_count is used to iterate through the deck of cards
    deck.cards[@card_count]
  end

  def record_guess(response)
    #if response is equal to answer, add one to number_correct
    guesses << Guess.new(response, deck.cards[@card_count])
    #Add a new guess into a guess array, with guess and current card as input
    guesses.last #Access the last element of the array
  end

  def count
    guesses.count
  end

  def number_correct
    @number_correct
  end


end
