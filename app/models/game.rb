class Game < ApplicationRecord
    has_many :difficulty_modes, dependent: :destroy
    has_many :decks, dependent: :destroy
    validates :title, presence: true
    belongs_to :user
end
