class CardGenerator

attr_reader :card_deck

  def initialize(filename)
    @filename  = filename
    @card_deck = []
  end

  def cards
    @card_deck = File.readlines(@filename).map do |line|
      chunk_of_line = line.chomp.split(",")
      Card.new(chunk_of_line[0], chunk_of_line[1], chunk_of_line[2])
    end
  end
end
