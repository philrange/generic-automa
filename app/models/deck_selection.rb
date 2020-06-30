class DeckSelection < ApplicationRecord
    belongs_to :difficulty_mode
    validates :number_of_cards, numericality: { greater_than: 0 }
    
    def deck
        @deck = Deck.find(deck_id)
        return @deck
    end
end
