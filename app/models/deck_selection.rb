class DeckSelection < ApplicationRecord
    belongs_to :difficulty_mode
    validates :number_of_cards, numericality: { greater_than_or_equal_to: 0, only_integer: true }
    
    def deck
        @deck = Deck.find(deck_id)
        return @deck
    end
    
    def number_of_cards_for_display
        if number_of_cards > 0
            return number_of_cards.to_s + " cards"
        else
            return "All (" + deck.cards.length.to_s + " cards)"
        end
    end
end
