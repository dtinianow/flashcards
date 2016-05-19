class CardGenerator

attr_reader :card_deck

  def initialize(filename)
    @filename = filename
    @card_deck = []
  end

  def cards
    File.readlines(@filename).each do |line|
      chunk_of_line = line.chomp.split(",")
      @card_deck << Card.new(chunk_of_line[0], chunk_of_line[1], chunk_of_line[2])
    end
    @card_deck
  end

end
