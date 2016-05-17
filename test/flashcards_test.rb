gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/flashcard'
require './lib/guess'
require './lib/deck'
require './lib/round'

class FlashCardsTest < Minitest::Test
  def test_if_card_accepts_data
    card = FlashCard.new("What is the capital of Alaska?", "Juneau")
    assert_equal "What is the capital of Alaska?", card.question
    assert_equal "Juneau", card.answer
  end

  def test_a_guess
    card = FlashCard.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Juneau", guess.response
  end

  def test_guess_displays_response
    card = FlashCard.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal true, guess.correct?
  end

  def test_for_feedback
    card = FlashCard.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Correct!", guess.feedback
  end

  def test_to_create_a_deck
    # skip
    card_1 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_2 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_3 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal [card_1, card_2, card_3], deck.cards
  end

  def test_to_check_count
    # skip
    card_1 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_2 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_3 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal 3, deck.count
  end

  def test_round
    # skip
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
      assert_equal "0%", round.percent_correct
  end
end
