class Game < ApplicationRecord
    has_many :difficulty_modes
    has_many :decks
    validates :title, presence: true
    belongs_to :user
end
