class Guess

attr_reader :response,
            :card

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    @response == card.answer
  end

  def feedback
    @response == card.answer ? "Correct!" : "Incorrect."
    # "Correct!"   if @response == card.answer
    # "Incorrect." if @response != card.answer
  end

end
