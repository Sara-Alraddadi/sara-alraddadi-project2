class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.date :published_date
      t.integer :user_rate
      t.integer :price
      t.text :description
      t.string :img

      t.timestamps
    end
  end
end
