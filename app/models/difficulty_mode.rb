class DifficultyMode < ApplicationRecord
    belongs_to :game
    has_many :deck_selections
end
