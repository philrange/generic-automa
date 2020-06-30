class AddDeckToDeckSelection < ActiveRecord::Migration[6.0]
  def change
    add_reference :deck_selections, :deck, null: false, foreign_key: true
  end
end
