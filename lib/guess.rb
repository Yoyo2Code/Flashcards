class Guess
  attr_reader :response,
              :card,
              :recorded_feedback

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    @response == card.answer
  end

  def feedback
    correct? ? "Correct!" : "Sorry, Incorrect!"
  end
end
