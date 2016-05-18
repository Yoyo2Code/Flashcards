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
    percentage = number_correct / guesses.count.to_f * 100
    "#{percentage}%"
  end

  def start
    card_count = 0
    puts "Welcome! You're playing with #{deck.cards.count} cards."
    puts "--------------------------------------------"
    until card_count == deck.cards.count
      puts "This card is #{@guesses.length} out of #{deck.cards.count}."
      puts "Question: #{current_card.question}"
        record_guess(gets.chomp)
      puts "#{guesses[card_count].feedback}"
      card_count += 1
    end
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{deck.cards.count} for a score of #{percent_correct}."
  end
end
