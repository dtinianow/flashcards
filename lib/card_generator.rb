class CardGenerator

attr_reader :card_deck,
            :hints

  def initialize(filename)
    @filename = filename
    @card_deck = []
    @hints = hints
  end

  def cards
    File.readlines(@filename).each do |line|
      flashcard = line.chomp.split(",")
      @card_deck << Card.new(flashcard[0], flashcard[1])
      @hints << flashcard[2]
    end
    @card_deck
  end

end
