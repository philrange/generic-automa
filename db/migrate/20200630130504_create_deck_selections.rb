class CreateDeckSelections < ActiveRecord::Migration[6.0]
  def change
    create_table :deck_selections do |t|
      t.references :difficulty_mode, null: false, foreign_key: true
      t.integer :number_of_cards

      t.timestamps
    end
  end
end
