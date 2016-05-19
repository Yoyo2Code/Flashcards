gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/flashcard'
require './lib/guess'
require './lib/deck'
require './lib/round'

class FlashCardsTest < Minitest::Test
  def test_if_card_accepts_data
    card = FlashCard.new("Why is the sky blue?", "You tell me")
    assert_instance_of FlashCard, card
  end

  def test_for_question
    card = FlashCard.new("What is the capital of Colorado?", "Denver")
    assert_equal "What is the capital of Colorado?", card.question
  end

  def test_for_answer
    card = FlashCard.new("What color is my hair?", "Black")
    assert_equal "Black", card.answer
  end

  def test_if_questions_can_be_answers
    card = FlashCard.new("What color is the dress?", "What color do you see?")
    assert_equal "What color do you see?", card.answer
  end

  def test_if_answers_can_be_questions
    card = FlashCard.new("Hippos", "What about hippos?")
    assert_equal "Hippos", card.question
  end
end
