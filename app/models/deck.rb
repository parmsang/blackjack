module Deck

  attr_accessor :deck

  def initialize
    suits = ['S','C','D','H']
    values = ['A','2','3','4','5','6','7','8','9','T','J','Q','K']
    cards = []
    values.each do |x|
      suits.each do |y|
        cards << ( x + y ).to_sym
      end
    end
    @deck = shuffle(cards)
    
  end

  def shuffle(unshuffled_cards)
    shuffled_cards = unshuffled_cards.sample(unshuffled_cards.length)
  end

end
