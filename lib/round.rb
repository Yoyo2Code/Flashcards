require './lib/flashcard'
require 'pry'

class Round
  attr_reader :guesses,
              :deck,
              :number_correct

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    deck.cards[@guesses.length]
  end

  def record_guess(guess)
    @guesses << Guess.new(guess, current_card)
  end

  def number_correct
    guesses.count { |guess| guess.correct? }
  end

  def percent_correct
    percentage = number_correct / guesses.count
    "#{percentage}%"
  end
end
