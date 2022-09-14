class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.string :subject
      t.integer :score

      t.timestamps
    end
  end
end
