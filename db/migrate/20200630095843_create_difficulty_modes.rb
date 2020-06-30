class CreateDifficultyModes < ActiveRecord::Migration[6.0]
  def change
    create_table :difficulty_modes do |t|
      t.string :name
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
