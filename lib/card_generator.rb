class CardGenerator

attr_reader :card_deck

  def initialize(filename)
    @filename = filename
    @card_deck = []
  end

  def cards
    File.readlines(@filename).each do |line|
      flashcard = line.chomp.split(",")
      @card_deck << Card.new(flashcard[0], flashcard[1])
    end
    @card_deck
  end

end
