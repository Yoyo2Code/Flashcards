require './lib/flashcard'
require './lib/guess'
require './lib/deck'
require './lib/round'

class CardGenerator
  attr_reader :file_name

  def initialize(filename)
    @file_name = filename
  end

  def cards
    File.open("#{file_name}", "r") do |file|
      make_cards = []
      file.each_line do |line|
        make_cards << line.chomp.split(",")
      end
      cards = []
      make_cards.map do |question, answer|
        cards << FlashCard.new(question, answer)
      end
      deck = Deck.new(cards)
      starting_round = Round.new(deck)
      fish.start
    end
  end
end

filename = ARGV[-1]

cards = CardGenerator.new(filename).cards
