class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.text :text
      t.integer :number_of_cards
      t.boolean :loop

      t.timestamps
    end
  end
end
