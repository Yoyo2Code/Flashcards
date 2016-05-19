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

  def end_game_text
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{deck.cards.count} for a score of #{percent_correct}."
  end

  def start_game_text
    puts "Welcome! You're playing with #{deck.cards.count} cards."
    puts "-----------------------------------------"
  end

  def display_question
    puts "This card is #{@guesses.length + 1} out of #{deck.cards.count}."
    puts "Question: #{current_card.question}"
  end

  def start
    card_index = 0
    start_game_text
    until card_index == deck.cards.count
      display_question
      record_guess(gets.chomp)
      puts "#{guesses[card_index].feedback}"
      card_index += 1
    end
    end_game_text
  end
end
