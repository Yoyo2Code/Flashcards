class Guess
  attr_reader :response,
              :card,
              :recorded_feedback

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    @response.downcase == card.answer.downcase
  end

  def feedback
    correct? ? "Correct!" : "Sorry, Incorrect!"
  end
end
