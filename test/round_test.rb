gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/flashcard'
require './lib/guess'
require './lib/deck'
require './lib/round'

class FlashCardsTest < Minitest::Test

  def test_round_accepts_deck
    card_1 = FlashCard.new("Why are people able to fly airplanes?", "Because we can")
    card_2 = FlashCard.new("Where is the best beach in Florida?", "Miami")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal round.deck, deck
  end

  def test_round_has_no_guesses_at_start
    card_1 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_2 = FlashCard.new("What is the city of Alabama?", "Birmingham")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal [], round.guesses
  end

  def test_round_records_a_guess
    card_1 = FlashCard.new("Why do I smell good?", "I just do")
    deck = Deck.new([card_1])
    round = Round.new(deck)
    round.record_guess("Heros")
    assert_equal 1, round.guesses.count
  end

  def test_current_card
    card_1 = FlashCard.new("Where am I?", "First in deck")
    card_2 = FlashCard.new("Where am I?", "Second in deck")
    card_3 = FlashCard.new("Where am I?", "Third in deck")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    assert_equal card_1, round.current_card
  end

  def test_round_gives_feedback_for_guesses
    card_1 = FlashCard.new("Where do I enjoy eating?", "Panda Express")
    card_2 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Heros")
    assert_equal "Sorry, Incorrect!", round.guesses.first.feedback
  end

  def test_round_records_number_correct
    card_1 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_2 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_3 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.record_guess("Heros")
    assert_equal 0, round.number_correct
  end

  def test_round_gives_percent_correct
    card_1 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_2 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_3 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.record_guess("Heros")
    assert_equal 0, round.number_correct
    assert_equal "0.0%", round.percent_correct
  end
end
