class Deck < ApplicationRecord
    has_many :cards
    belongs_to :game, foreign_key: 'game_id'
    has_and_belongs_to_many :deck_selections
end
