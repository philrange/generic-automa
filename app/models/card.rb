class Card < ApplicationRecord
    has_one_attached :card_image
    belongs_to :deck
end
