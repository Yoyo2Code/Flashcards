gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/flashcard'
require './lib/guess'
require './lib/deck'
require './lib/round'

class FlashCardsTest < Minitest::Test

  def test_round
    card_1 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_2 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_3 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)
  end

  def test_guesses_start_empty
    card_1 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_2 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_3 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    assert_equal [], round.guesses
  end

  def test_record_guess
    card_1 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_2 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_3 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.record_guess("Heros")

    assert_equal 1, round.guesses.count
  end

  def test_current_card
    card_1 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_2 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_3 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    assert_equal card_1, round.current_card
  end

  def test_feedback_guesses
    card_1 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_2 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_3 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.record_guess("Heros")

    assert_equal "Sorry, Incorrect!", round.guesses.first.feedback
  end

  def test_number_correct
    card_1 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_2 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_3 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.record_guess("Heros")

    assert_equal 0, round.number_correct
  end

  def test_percent_correct
    card_1 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_2 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_3 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.record_guess("Heros")
    
    assert_equal 0, round.number_correct
    assert_equal "0%"
  end
end
