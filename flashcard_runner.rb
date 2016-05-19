require './lib/flashcard'
require './lib/guess'
require './lib/deck'
require './lib/round'

class CardGenerator

  def initialize(filename)
    @file_name = filename
  end

  def cards
    card_file = File.open("#{@file_name}", "r") do |file|
      card_array = []
      file.each_line do |line|
        card_array << line.chomp.split(",")
      end
      cards = []
      card_array.map do |question, answer|
        cards << FlashCard.new(question, answer)
      end
      deck = Deck.new(cards)
      round = Round.new(deck)
      round.start
    end
  end
end

filename = "cards.txt"
cards = CardGenerator.new(filename).cards
